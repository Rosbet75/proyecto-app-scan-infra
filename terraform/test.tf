resource "aws_instance" "servidor_mainTerraform" {
  ami           = "ami-0c7217cdde317cfec" # ID de una AMI de Ubuntu 22.04 LTS en us-east-1 (verifica el ID según tu región)
  instance_type = "t2.micro"             # Entra en la capa gratuita de AWS

  tags = {
    Name = "DevSecOps-JuiceShop-Server"
  }
}

#testtestadfasdf