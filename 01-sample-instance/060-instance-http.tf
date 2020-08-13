#### INSTANCE HTTP ####

# Create instance
resource "aws_instance" "http" {
  ami           = var.centos7
  instance_type = "t2.medium"
  key_name      = aws_key_pair.user_key.key_name
  vpc_security_group_ids = [
    aws_security_group.administration.id,
    aws_security_group.web.id,
  ]
  subnet_id = aws_subnet.http.id
  associate_public_ip_address = true
  user_data = file("scripts/first-boot.sh")
  tags = {
    Name = "terraform-cloud"
  }
}
/*
# Attach floating ip on instance http
resource "aws_eip" "public_http" {
  vpc        = true
  instance   = aws_instance.http.id
  depends_on = [aws_internet_gateway.gw]
  tags = {
    Name = "public-http"
  }
}
*/
