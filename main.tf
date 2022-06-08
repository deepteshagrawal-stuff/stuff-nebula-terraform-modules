resource "aws_s3_bucket" "stuff-nebula-terraform-modules" {
  bucket = "stuff-terraform-nebula-modules"
  tags = {
    Name        = "stuff-terraform-nebula-modules"
  }
}

resource "aws_s3_bucket_versioning" "enable" {
  bucket = aws_s3_bucket.stuff-nebula-terraform-modules.id

  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_acl" "private" {
  bucket = aws_s3_bucket.stuff-nebula-terraform-modules.id
  acl    = "private"
}