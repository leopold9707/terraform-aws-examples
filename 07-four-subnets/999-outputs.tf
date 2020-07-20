output Admin_fip {
  value = aws_eip.public_http.public_ip
}

output hosts_ip {
  value = {
    for instance in aws_instance.VM:
    instance.tags.Name => instance.private_ip
  }
}
