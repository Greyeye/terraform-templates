# default region, use us-east-1 as primary region
aws_region  = "us-east-1"
# environment name MUST match with branch name.
environment = "development"
# AWS account number
accountnumber = "123456789012"
# vpc id to be used for both regions
vpc_id = {
  "us-east-1" = "vpc-id1",
  "us-west-2" = "vpc-id2"
}
# lambda setting for the subnet, specify two or more
lambda_vpc_subnet_ids = {
  "us-east-1" = [
    "subnet-id1",
    "subnet-id2"],
  "us-west-2" = [
    "subnet-id1",
    "subnet-id2"]
}
# VPC network
vpc_cidr = {
  "us-east-1" = "10.0.0.0/16",
  "us-west-2" = "10.1.0.0/16"
}
# distribution bucket for Lambda's Code (will create two buckets for each regions)
lambda_dist_bucket = "projectName-deploy"
lambda_dist_key = "projectName-development/dist/lambda.zip"
// ACM requests take a time to validate(can take hrs)
// do not request ACM using terraform, instead setup by other terraform or code.
acm_arns = {
  "us-east-1" = "arn:aws:acm:us-east-1:123456789012:certificate/acmid1",
  "us-west-2" = "arn:aws:acm:us-west-2:123456789012:certificate/acmid2"
}
# custom domain name for API Gateway
api_domain_name = "customapi.domainname.com"
# Route53 Zone to update API Gateway Custom Domain
route53_zone_id = "Z123456789012"

project_name = "projectName"

# code run time, use value from
# https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime
lambda_runtime = "node14.x"
lambda_timeout = 29