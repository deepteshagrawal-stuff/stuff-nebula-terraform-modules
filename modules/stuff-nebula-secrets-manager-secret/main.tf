resource "aws_secretsmanager_secret" "secret" {
  name          = var.name
  description   = var.description
}

resource "aws_secretsmanager_secret_version" "secret_version" {
  secret_id     = aws_secretsmanager_secret.secret.id
  secret_string = var.secret_string
}