#### INSTANCE HTTP ####

# Create instance
resource "aws_instance" "VM" {
  for_each	= { for host in var.hosts[*] : host => var.spec_of_hosts[host] }
  
  ami           = var.centos7
  instance_type = var.spec[each.value.role].flavor
  key_name      = aws_key_pair.user_key.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.web.id,
  ]
  subnet_id = aws_subnet.subnets[each.value.subnet].id
  root_block_device {
    volume_type = "standard"
    volume_size = var.spec[each.value.role].root_volume_size
    delete_on_termination = true
  }
  tags = {
    Name = each.key
 }
}

# Create volume
resource "aws_ebs_volume" "additional_storage" {
  for_each = { for host in var.hosts[*] : host => var.spec_of_hosts[host] }
  
  availability_zone = aws_instance.VM[each.key].availability_zone
  size              = var.spec[each.value.role].additional_volume
}

# Attach volume to instance
resource "aws_volume_attachment" "additional_storage" {
  for_each = { for host in var.hosts[*] : host => var.spec_of_hosts[host] }

  device_name  = "/dev/xvdh"
  force_detach = true
  volume_id    = aws_ebs_volume.additional_storage[each.key].id
  instance_id  = aws_instance.VM[each.key].id
}

# Attach floating ip on instance http
resource "aws_eip" "public_http" {
  vpc        = true
  instance   = aws_instance.VM["Admin"].id
  depends_on = [aws_internet_gateway.gw_1]
  tags = {
    Name = "Admin_eip"
  }
}

