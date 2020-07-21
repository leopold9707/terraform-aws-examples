output 1-admin_fip {
  value = aws_eip.1-admin_fip.public_ip
}

output 2-admin_fip {
  value = aws_eip.2-admin_fip.public_ip
}

output host_private_ip_list {
  value = {
    for instance in aws_instance.instances:
    instance.tags.Name => instance.private_ip
  }
}
