terraform {
  required_version = ">= 1.15"

  cloud {
    organization = "emolinam5"
    workspaces {
      name = "lab-ec2"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "tls" {
}