terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.16.2"
    }
  }

  backend "s3" {
    bucket = "marcosremotestate"
    key    = "pipeline-github/terraform.ftstate"
    region = "eu-central-1"
  }
}


provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      owner = "marcoslima"
      managed-by = "terraform"
    }
  }
}

data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "marcosremotestate"
    key    = "aws-vpc/terraform.ftstate"
    region = "eu-central-1"   
  }
}



