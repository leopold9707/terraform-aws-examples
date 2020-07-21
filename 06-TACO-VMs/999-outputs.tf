output eip {
  value = aws_eip.public_http["Admin-01"].public_ip
}

output private_ip {
  value = {
    for instance in aws_instance.http:
    instance.id => instance.private_ip
  }
}
