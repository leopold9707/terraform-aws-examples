output host_private_ip_list {
  value = {
    for host in var.hosts:
    aws_instance.instances[host].private_ip => host
  }
}

output host_public_ip_list {
  value = {
    for host in var.hosts:
    aws_instance.instances[host].public_ip => host
  }
}
