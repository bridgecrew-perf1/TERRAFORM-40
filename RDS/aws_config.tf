# aws_config.tf

terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.26"
      
    }
  }
  backend "s3" {
    region  =  "us-east-1"
    profile = "default"
    key     = "terraformbucket98929978"
    bucket  = "terraformbucket98929978"
  }
}

provider "aws" {
 region = var.aws_region
}
