terraform {
  required_version = "= 1.2.4"
  backend "s3" {}

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "= 3.61.0"
    }
  }
}