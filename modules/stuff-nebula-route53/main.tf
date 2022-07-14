resource "aws_route53_record" "route53-record" {
  zone_id = var.hosted_zone
  name    = var.record_name
  type    = var.record_type

  alias {
    name                   = var.alias
    zone_id                = var.elb_hosted_zone
    evaluate_target_health = false
  }
}
