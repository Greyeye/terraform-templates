output bucket_id {
  value = aws_s3_bucket.staticweb_bucket.id
}

output bucket_arn {
  value = aws_s3_bucket.staticweb_bucket.arn
}
output bucket_domain_name {
  value = aws_s3_bucket.staticweb_bucket.bucket_domain_name
}
output bucket_domain_zone_id {
  value = aws_s3_bucket.staticweb_bucket.hosted_zone_id
}
