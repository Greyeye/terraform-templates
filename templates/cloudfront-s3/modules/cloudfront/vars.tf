
variable cloudfront_aliases {
  description = "host name/alias for cloudfront, eg api.service.makeabeeline.dev"
}


variable s3_staticweb_bucket_origin_dns_useast1 {
  description = "s3 bucket url"
}
variable s3_staticweb_bucket_origin_id_useast1 {
  description = "unique identifiers for s3 bucket origin"
}
variable s3_staticweb_bucket_origin_dns_uswest2 {
  description = "s3 bucket url"
}
variable s3_staticweb_bucket_origin_id_uswest2 {
  description = "unique identifiers for s3 bucket origin"
}
variable s3_staticweb_origin_access_identity {
  description = "origin access identity for the s3 bucket"
}

variable acm_certificate_arn {
  description = "acm certificate arn"
}
variable access_log_bucket_name {
  description = "log bucket name"
}
variable environment {
  description = "deployment environment name, used for origin path identifier"
  default = "development"
}

variable tags {
  default = null
}
variable deploymentID {}

variable origin_request_policy_id {

}

variable cache_policy_id {}

variable comment {}
