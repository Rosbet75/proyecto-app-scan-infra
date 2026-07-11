resource "aws_key_pair" "ssh_main_key" {
  key_name = "main_ssh_key"
  public_key = var.clave_ssh_publica
}

resource "aws_instance" "servidor_mainTerraform" {
  ami           = "ami-0c7217cdde317cfec" # ID de una AMI de Ubuntu 22.04 LTS en us-east-1 (verifica el ID según tu región)
  instance_type = "t2.micro"             # Entra en la capa gratuita de AWS

  key_name = aws_key_pair.ssh_main_key
  vpc_security_group_ids = [aws_security_group.permitir_ssh_juice_shop.id]
  tags = {
    Name = "DevSecOps-JuiceShop-Server"
  }
}

resource "aws_security_group" "permitir_ssh_juice_shop" {
  name = "permitir_ssh_juice_shope"
  description = ""
  ingress {
    description = "SSH"
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}