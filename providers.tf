# ------ PROVIDERS ------
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
provider "aws" {
  profile = "kate-yefimovich"
  region  = "eu-north-1"
  default_tags {
    tags = {
        Owner = "Katerina-Yefimovich"
    }
  }
}