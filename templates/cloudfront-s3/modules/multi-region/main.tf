resource "random_id" "server" {
  keepers = {
    region_name = var.aws_region
  }
  byte_length = 8
}


module "staticweb_bucket" {
  source = "../s3"
  bucket_name = local.bucket_name
  s3_tags = {
    Name = local.bucket_name
    Terraform = true
    DeploymentID = random_id.server.hex
    Description = "Secure File Transfer static web bucket"
  }
  s3_policy = data.aws_iam_policy_document.bucket-policy.json
  life_cycle_enabled = false
  files = var.files
}

locals {
  # don't include environment name, as tfvar should specify the environment name (eg mbp-development)
  bucket_name = "${var.s3_dist_bucket}-${var.aws_region}-${var.environment}-${random_id.server.hex}"
}
