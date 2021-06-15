resource "aws_route53_record" "a_record" {
  zone_id = var.route53_zone_id
  name    = ""
  type    = "A"

  alias {
    name                   = var.alias_host_name
    zone_id                = var.alias_zone_id
    evaluate_target_health = false
  }
//  set_identifier = "latency"
//  latency_routing_policy {
//    region = var.aws_region
//  }
}
