provider "aws" {
  region = "ap-southeast-2"
}

terraform {
  backend "s3" {
    bucket  = "stuff-terraform-nebula"
    region  = "ap-southeast-2"
    key     = "shared/stuff-nebula-terraform-modules-state.tfstate"
  }
}