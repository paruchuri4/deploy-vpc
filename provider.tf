
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.5"
    }
  }
}

provider "aws" {
  profile = "default" # specify  different profile name  in case of not default one
  region  = var.aws_region
}