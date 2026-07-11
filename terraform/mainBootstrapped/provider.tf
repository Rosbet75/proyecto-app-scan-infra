terraform {
    required_version = "~> 1.15.7"
    required_providers {
      aws = {
        source = "hashicorp/aws"
        version = "~> 6.0"
      }
    }
    # 2. El Backend Remoto (El truco para que guarde el estado en S3)
    # Nota: Comenta esta sección de "backend" la PRIMERA vez que corras Terraform localmente
    # si aún no has creado el bucket de S3.
    backend "s3" {
        bucket = "terraform-principal"
        key = "devsecops/terraform.tfstate"
        region = "us-east-2"
        encrypt = true

    }
}


provider "aws" {
  region = "us-east-1"
}
##test