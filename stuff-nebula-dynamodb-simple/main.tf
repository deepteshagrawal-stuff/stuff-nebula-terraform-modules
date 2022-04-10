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
