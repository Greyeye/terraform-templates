variable "aws_region" {
  description = "aws region"
  type = string
}
variable "environment" {
  description = "type of environment, development, production"
  type = string
  default = "development"
}

variable "accountnumber" {
  description = "aws account number"
  type = string
}

variable "lambda_vpc_subnet_ids" {
  description = "VPC subnets used by the lambda"
  type = object({
    us-east-1 = list(string)
    us-west-2 = list(string)
  })
}


variable "lambda_dist_bucket" {
  description = "S3 bucket where source code is uploaded"
  type = string
}

variable "lambda_dist_key" {
  description = "lambda source code file name in S3 bucket"
  default = "mbp-development/dist/lambda.zip"
}
variable "vpc_id" {
  description = "VPC ID for lambda to execute"
  type = object({
    us-east-1 = string
    us-west-2 = string
  })

}

variable "vpc_cidr" {
  description = "VPC network subnet CIDR"
  type = object({
    us-east-1 = string
    us-west-2 = string
  })
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

variable "api_domain_name" {
  description = "DNS name to use for the MBP service"
  type = string
}

variable "route53_zone_id" {
  # please create a sub domain zone dedicated for the project
  description = "Route53 zone ID to make change"
  type = string
}

variable project_name {
  description = "Project Name"
  type = string
}

variable "lambda_runtime" {
  description = "lambda run time, please use one from the url https://docs.aws.amazon.com/lambda/latest/dg/API_CreateFunction.html#SSS-CreateFunction-request-Runtime"
  type = string
}