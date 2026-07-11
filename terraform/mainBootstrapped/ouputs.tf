output "mainTerraform_public_ip" {
    description = "IP servidor de Terraform"
    value = aws_instance.servidor_mainTerraform.public_ip
}