output public_ip {
  value = aws_instance.http.public_ip
}

output private_ip {
  value = aws_instance.http.private_ip
}

