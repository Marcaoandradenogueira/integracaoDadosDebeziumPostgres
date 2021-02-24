resource "aws_s3_bucket" "bucket_stack_debezium" {
  bucket = var.bucket_name
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = local.tags.s3
}

resource "aws_s3_bucket_public_access_block" "block_access_public" {
  bucket = aws_s3_bucket.bucket_stack_debezium.id

  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}