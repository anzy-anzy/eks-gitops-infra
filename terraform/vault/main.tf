resource "aws_security_group" "vault_sg" {
  name        = "vault-sg"
  description = "Security group for Vault server"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "Vault UI/API"
    from_port   = 8200
    to_port     = 8200
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "vault-sg"
  }
}

resource "aws_instance" "vault" {
  ami                         = var.ami_id
  instance_type               = "t3.small"
  subnet_id                   = var.public_subnet_id
  vpc_security_group_ids      = [aws_security_group.vault_sg.id]
  associate_public_ip_address = true

  tags = {
    Name = "vault-server"
  }
}