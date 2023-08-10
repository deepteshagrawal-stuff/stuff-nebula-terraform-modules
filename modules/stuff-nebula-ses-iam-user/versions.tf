terraform {
  required_providers {
    akamai = {
      source = "akamai/akamai"
      version = "3.3.0"
    }
    local = {
      source = "hashicorp/local"
      version = "2.3.0"
    }
  }
  required_version = ">= 0.14"
}