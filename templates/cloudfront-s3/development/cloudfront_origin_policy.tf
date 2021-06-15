resource "aws_cloudfront_origin_request_policy" "origin_request_policy" {
  name    = "mbp_cx_origin_request_policy-${var.environment}-${module.us-east-1.random_hex}"
  comment = "mbp_cx_origin_request_policy"
  cookies_config {
    cookie_behavior = "all"
  }
  headers_config {
    header_behavior = "none"
  }
  query_strings_config {
    query_string_behavior = "all"
  }
}


resource "aws_cloudfront_cache_policy" "cache_policy" {
  name = "mbp_cx_cache_policy-${var.environment}-${module.us-east-1.random_hex}"
  comment = "mbp_cx_cache_policy"
  default_ttl = 86400
  max_ttl     = 31536000
  min_ttl     = 1
  parameters_in_cache_key_and_forwarded_to_origin {
    cookies_config {
      cookie_behavior = "all"
    }
    headers_config {
      header_behavior = "none"
    }
    query_strings_config {
      query_string_behavior = "all"
    }
  }
}
