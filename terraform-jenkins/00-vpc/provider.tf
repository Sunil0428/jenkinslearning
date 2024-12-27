terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.81.0"
    }
  }
}

provider "aws" {
  # Configuration options
}

data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "sunil-prod-bucket"
    key    = "vpc-terraform"
    region = "us-east-1"
    dynamodb_table = "sunil-dev-vpc"

  }
}