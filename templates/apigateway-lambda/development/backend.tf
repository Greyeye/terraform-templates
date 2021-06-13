terraform {
  backend "s3" {
    bucket         = "companyname-terraform-backend-development"
    key            = "project-name-development/state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-locks-development"
  }
}
