resource "aws_instance" "web" {
  ami                    = "ami-017fecd1353bcc96e"
  instance_type          = var.instance_type
  private_ip             = var.server_private_ipv4
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.vpc_security_group_ids
  key_name               = var.ssh_key_name
  tags = {
    Name        = "${var.app_name}-${var.stage}-http-server"
    Service     = var.app_name
    Environment = var.stage
  }
}

resource "aws_eip_association" "eip_assoc" {
  instance_id   = aws_instance.web.id
  allocation_id = var.elastic_ip_allocation_id
}
