data "akamai_contract" "contract" {
  group_name = var.group_name
}

data "akamai_group" "group" {
  group_name = var.group_name
  contract_id = data.akamai_contract.contract.id
}

resource "akamai_property" "property" {
  name               = var.property_name
  product_id         = var.product_id
  contract_id        = data.akamai_contract.contract.id
  group_id           = data.akamai_group.group.id
  dynamic "hostnames" { 
      for_each = var.hostnames
      content {                  
        cname_from = hostnames.value["cname_from"]
        cname_to = hostnames.value["edge_hostname"]
        cert_provisioning_type = "CPS_MANAGED"
      }
  }
  rule_format = "v2023-01-05"
  rules = var.rules
}

resource "akamai_property_activation" "staging" {
  property_id = akamai_property.property.id
  contact  = var.email
  version  = akamai_property.property.latest_version
  auto_acknowledge_rule_warnings = true
}

resource "akamai_property_activation" "production" {
  property_id = akamai_property.property.id
  contact  = var.email
  version  = akamai_property.property.latest_version
  auto_acknowledge_rule_warnings = true
  network  = "PRODUCTION"
  depends_on = [
    akamai_property_activation.staging
  ]
}

resource "akamai_edge_hostname" "edge_hostname" {
  product_id       = var.product_id
  contract_id        = data.akamai_contract.contract.id
  group_id           = data.akamai_group.group.id
  edge_hostname = var.edge_hostname
  ip_behavior   = "IPV6_COMPLIANCE"
  certificate  = var.certificate_id
}