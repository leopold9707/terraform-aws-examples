output VPC_1_admin_fip {
  value = aws_eip.vpc_1_admin.public_ip
}

output VPC_2_Admin_fip {
  value = aws_eip.vpc_2_admin.public_ip
}

output host_private_ip_list {
  value = {
    for host in var.hosts:
    host => aws_instance.instances[host].private_ip
  }
}
