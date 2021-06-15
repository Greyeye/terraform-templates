# bucket policy to prevent access from non SSL/TLS connections
data "aws_iam_policy_document" "bucket-policy" {
  statement {
    sid = "origin1"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [var.distribution_origin_iam_arn]
    }
    actions = ["s3:GetObject"]
    resources = [
      "arn:aws:s3:::${local.bucket_name}/*",
      "arn:aws:s3:::${local.bucket_name}"
    ]
  }
  statement {
    sid = "origin2"
    effect = "Allow"
    principals {
      type = "AWS"
      identifiers = [var.distribution_origin_iam_arn]
    }
    actions = ["s3:ListBucket"]
    resources = [
      "arn:aws:s3:::${local.bucket_name}"
    ]
  }
  statement {
    sid = "ssl1"
    effect = "Deny"
    actions = ["s3:*"]
    resources = [
      "arn:aws:s3:::${local.bucket_name}",
      "arn:aws:s3:::${local.bucket_name}/*"
    ]
    condition {
      test = "Bool"
      values = ["false"]
      variable = "aws:SecureTransport"
    }
    principals {
      type = "*"
      identifiers = ["*"]
    }
  }
}
