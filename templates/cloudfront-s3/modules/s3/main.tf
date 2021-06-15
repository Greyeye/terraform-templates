
resource "aws_s3_bucket" "staticweb_bucket" {
  bucket = var.bucket_name

  lifecycle_rule {
    enabled = var.life_cycle_enabled
    expiration {
      days = var.bucket_expiry_after_x_days
    }
  }
  lifecycle {
    prevent_destroy = true
  }
  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  policy = var.s3_policy
  tags = var.s3_tags
}

resource "aws_s3_bucket_public_access_block" "acl" {
  bucket = aws_s3_bucket.staticweb_bucket.id
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls = true
  restrict_public_buckets = true
}


resource "aws_s3_bucket_object" "staticweb" {
  for_each = var.files
  bucket = aws_s3_bucket.staticweb_bucket.id
  content_type = each.value.content_type
  key = each.key
  source = each.value.source_path
  etag = each.value.digests.md5
}
