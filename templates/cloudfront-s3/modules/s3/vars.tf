variable bucket_name {
  description = "bucket name"
}

variable bucket_expiry_after_x_days {
  description = "specify number of days for object before expiration"
  default = 7
}

variable life_cycle_enabled{
  description ="show if lifecycle rules are enabled"
  default = true
}

variable s3_tags {
  description = "tags"
}

variable s3_policy {
  description = "policy"
  default = ""
}
variable "files" {}
