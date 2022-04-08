provider "aws" {
  region = "ap-southeast-2"
  assume_role {
    session_name = "aws_role_assumed"
    role_arn     = var.account_role_arn
  }
}

terraform {
  backend "s3" {
    bucket  = "stuff-terraform-nebula"
    region  = "ap-southeast-2"
    key     = var.backend_state_key
  }
}