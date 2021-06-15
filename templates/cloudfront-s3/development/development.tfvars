aws_region  = "us-east-1"

# environment name MUST match with branch name.
environment = "development"
accountnumber = "123456789012"
#distribution bucket name, this will be created automatically. please keep it short
s3_dist_bucket = "projectName-deploy"

// ACM certificate for mbp.service.makeabeeline.dev and *.mbp.service.makeabeeline.dev
// ACM requests take a time to validate(can take hrs), do not request ACM using terraform
acm_arns = {
  "us-east-1" = "arn:aws:acm:us-east-1:123456789012:certificate/acmid1",
  "us-west-2" = "arn:aws:acm:us-west-2:123456789012:certificate/acmid2"
}

# custom domain name for CloudFront
cf_domain_name = "custom.domainname.com"
# baseline domain name
root_domain_name = "domainname.com"
# Route53 Zone to update CF domains
route53_zone_id = "Z123456789012"

project_name = "projectName"