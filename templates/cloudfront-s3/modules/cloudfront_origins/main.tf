resource "aws_cloudfront_origin_access_identity" "origin_access_identity" {
  comment = "origin identity for cloudfront for ${var.origin_name}"
}