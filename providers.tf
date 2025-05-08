# ------ PROVIDERS ------
terraform {
  required_version = ">= 1.10.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  region = "eu-north-1"
  default_tags {
    tags = {
      Owner = "Katerina-Yefimovich"
    }
  }
}
terraform {
  backend "s3" {
    bucket         = "bucket-for-store-tfstate-pipeline-1"
    key            = "terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
    dynamodb_table = "lock-table"
  }
}
