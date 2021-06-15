variable "aws_region" {
  description = "aws region"
}
variable "environment" {
  description = "type of environment, development, production"
}

variable "accountnumber" {
  description = "aws account number"
}

variable "s3_dist_bucket" {
  description = "S3 bucket where static web files are uploaded"
}

variable "acm_arns" {
  # Please create a ACM cert dedicated for the API
  # (eg *.<apiname>.service.makeabeeline.com and <apiname>.service.makeabeeline.com)
  description = "AMAZON Certificate Manager's cert arn to be used for custom domain"
  type = object({
    us-east-1 = string
    us-west-2 = string
  })
}

variable "cf_domain_name" {
  description = "DNS name to use for the MBP web"
}
variable "root_domain_name" {
  description = "root domain for the project"
}

variable "route53_zone_id" {
  # please create a sub domain zone dedicated for the project
  description = "Route53 zone ID to make change"
}

variable "project_name" {
  description = "project short name"
  type = string
}