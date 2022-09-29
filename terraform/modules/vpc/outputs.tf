output "vpc_security_group_ids" {
  value = [aws_security_group.tls_ssh.id]
}

output "subnet_server" {
  value = aws_subnet.main_a.id
}

output "security_group" {
  value = aws_security_group.tls_ssh.id
}
