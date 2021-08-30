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
    key     = "terraformbucket98929988"
    bucket  = "terraformbucket98929988"
  #  access_key = "AKIAZBGNCHDCXCDDEO5A" 
  #  secret_key = "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"
  }
}

provider "aws" {
 region = var.aws_region
}
