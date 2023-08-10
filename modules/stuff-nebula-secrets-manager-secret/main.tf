resource "aws_secretsmanager_secret" "secret" {
  name          = var.name
  description   = var.description
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = var.secret_id
  secret_string = var.secret_string
}