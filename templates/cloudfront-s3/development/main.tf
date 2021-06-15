module "us-east-1" {
  source = "../modules/multi-region"
  aws_region = "us-east-1"
  environment = var.environment
  accountnumber = var.accountnumber
  acm_arn = var.acm_arns["us-east-1"]
  route53_zone_id = var.route53_zone_id
  cf_domain_name =  var.cf_domain_name
  s3_dist_bucket = var.s3_dist_bucket
  distribution_origin_iam_arn = module.distribution_origin_id.origin_iam_arn
  files = module.template_files.files
}

module "us-west-2" {
  source = "../modules/multi-region"
  providers = {
    aws = aws.us-west-2
  }
  aws_region = "us-west-2"
  environment = var.environment
  accountnumber = var.accountnumber
  s3_dist_bucket = var.s3_dist_bucket
  acm_arn = var.acm_arns["us-west-2"]
  cf_domain_name =  var.cf_domain_name
  route53_zone_id = var.route53_zone_id
  distribution_origin_iam_arn = module.distribution_origin_id.origin_iam_arn
  files = module.template_files.files
}



module "r53" {
  depends_on = [module.cloudfront]
  source = "../modules/route53"
  route53_zone_id = var.route53_zone_id
  alias_host_name =  module.cloudfront.cf_domain_name
  alias_zone_id = module.cloudfront.cf_zone_id
  environment = var.environment
  deploymentID = module.us-east-1.random_id
  aws_region = var.aws_region
}


module "template_files" {
  source = "hashicorp/dir/template"
  base_dir = "../../public/"
}
