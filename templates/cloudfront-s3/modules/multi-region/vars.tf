variable "aws_region" {
  description = "aws region"
}

variable "environment" {
  description = "type of environment, development, main"
}

variable "accountnumber" {
  description = "aws account number"
}

variable "s3_dist_bucket" {
}


variable "acm_arn" {}
variable "cf_domain_name" {}
variable "route53_zone_id" {}
variable "distribution_origin_iam_arn" {}
variable "files" {}
