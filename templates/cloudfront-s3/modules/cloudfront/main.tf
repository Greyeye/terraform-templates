
resource "aws_cloudfront_distribution" "distribution" {
  origin_group {
    origin_id = "groupS3"

    failover_criteria {
      status_codes = [500, 502]
    }

    member {
      origin_id = var.s3_staticweb_bucket_origin_id_useast1
    }

    member {
      origin_id = var.s3_staticweb_bucket_origin_id_uswest2
    }
  }
  # webpage - s3 bucket origin
  origin {
    domain_name = var.s3_staticweb_bucket_origin_dns_useast1
    origin_id   = var.s3_staticweb_bucket_origin_id_useast1
    s3_origin_config {
      origin_access_identity = var.s3_staticweb_origin_access_identity
    }
  }

  origin {
    domain_name = var.s3_staticweb_bucket_origin_dns_uswest2
    origin_id   = var.s3_staticweb_bucket_origin_id_uswest2
    s3_origin_config {
      origin_access_identity = var.s3_staticweb_origin_access_identity
    }
  }


  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.comment
  default_root_object = "index.html"

  logging_config {
    include_cookies = false
    bucket          = var.access_log_bucket_name
    prefix          = "log"
  }

  aliases = var.cloudfront_aliases

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "groupS3"


    viewer_protocol_policy = "allow-all"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
    origin_request_policy_id = var.origin_request_policy_id
    cache_policy_id = var.cache_policy_id
  }

  price_class = "PriceClass_200"

  restrictions {
    geo_restriction {
      restriction_type = "none"
//      locations        = ["US", "CA", "GB", "DE"]
    }
  }

  tags = var.tags

  viewer_certificate {
    cloudfront_default_certificate = false
    acm_certificate_arn = var.acm_certificate_arn
    ssl_support_method = "sni-only"
  }
  #redirect 404 (access denied) to /
  custom_error_response {
    error_code = 404
    response_code = 200
    response_page_path = "/"
    error_caching_min_ttl = 10
  }
}
