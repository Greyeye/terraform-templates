module "cloudfront" {
  depends_on = [module.us-east-1,module.us-west-2]
  source = "../modules/cloudfront/"
  deploymentID = module.us-east-1.random_id
  tags = {
    Name = "cloudfront for ${var.project_name}"
    Terraform = true
    DeploymentID = module.us-east-1.random_id
  }
  cloudfront_aliases = [var.cf_domain_name, var.service_domain_name]
  s3_staticweb_origin_access_identity = "origin-access-identity/cloudfront/${module.distribution_origin_id.origin_id}"
  s3_staticweb_bucket_origin_dns_useast1 = module.us-east-1.bucket_domain_name
  s3_staticweb_bucket_origin_id_useast1 = "${module.us-east-1.bucket_domain_name}-${var.environment}"
  s3_staticweb_bucket_origin_dns_uswest2 = module.us-west-2.bucket_domain_name
  s3_staticweb_bucket_origin_id_uswest2 = "${module.us-west-2.bucket_domain_name}-${var.environment}"

  acm_certificate_arn = var.acm_arns["us-east-1"]
  environment = var.environment
  origin_request_policy_id = aws_cloudfront_origin_request_policy.origin_request_policy.id
  cache_policy_id = aws_cloudfront_cache_policy.cache_policy.id
  access_log_bucket_name = module.us-east-1.bucket_domain_name
  comment = "CF distribution-${var.environment}-${module.us-east-1.random_hex}"
}

module "distribution_origin_id" {
  source = "../modules/cloudfront_origins"
  origin_name = "${var.project_name}-${var.environment}-${module.us-east-1.random_id} cloudfront identity"
}
