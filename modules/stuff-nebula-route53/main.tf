resource "aws_route53_record" "route53-record" {
  zone_id = var.hosted_zone
  name    = var.record_name
  type    = var.record_type
  ttl     = var.ttl

  records = [
    {
      name    = var.alias_name
      type    = var.record_type
      alias   = {
        name    = var.alias_name
        zone_id = var.hosted_zone   
      }
    }
  ]
}