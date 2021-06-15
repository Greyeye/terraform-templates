output "random_id" {
  value = random_id.server.id
}
output "random_hex" {
  value = random_id.server.hex
}

output "bucket_domain_zone_id" {
  value = module.staticweb_bucket.bucket_domain_zone_id
}

output "bucket_domain_name" {
  value = module.staticweb_bucket.bucket_domain_name
}

output "bucket_id" {
  value = module.staticweb_bucket.bucket_id
}
