provider "aws" {
  access_key                  = "mock_access_key"
  region                      = "ap-southeast-2"
  s3_use_path_style           = true
  secret_key                  = "mock_secret_key"
  skip_credentials_validation = true
  skip_metadata_api_check     = true
  skip_requesting_account_id  = true

  endpoints {
    s3       = "http://localhost:4566"
    sqs      = "http://localhost:4566"
    dynamodb = "http://localhost:4566"
  }

}

resource "aws_dynamodb_table" "dynamodb_pro" {
  count          = var.provisioned ? 1 : 0
  name           = var.table_name
  billing_mode   = "PROVISIONED"
  read_capacity  = var.read_capacity
  write_capacity = var.write_capacity
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  ttl {
    attribute_name = var.ttl_name
    enabled        = var.ttl_enabled
  }

  point_in_time_recovery {
    enabled = var.pit_enabled
  }

}

resource "aws_dynamodb_table" "dynamodb_ppr" {
  count          = var.provisioned ? 0 : 1
  name           = var.table_name
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = var.hash_key

  attribute {
    name = var.hash_key
    type = "S"
  }

  ttl {
    attribute_name = var.ttl_name
    enabled        = var.ttl_enabled
  }

  point_in_time_recovery {
    enabled = var.pit_enabled
  }

}
