provider "aws" {
  region = "ap-southeast-2"
  assume_role {
    session_name = "aws_role_assumed"
    role_arn     = "arn:aws:iam::545828170065:user/nebula-base-terraform-modules-sa"
  }
}

terraform {
  backend "s3" {
    bucket  = "stuff-terraform-nebula"
    region  = "ap-southeast-2"
    key     = "shared/stuff-nebula-terraform-modules-state.tfstate"
  }
}