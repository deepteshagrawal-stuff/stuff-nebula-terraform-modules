terraform {
  required_providers {
    fastly = {
      source  = "fastly/fastly"
      version = ">= 5.3.1"
    }
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
  required_version = ">= 0.14"
}