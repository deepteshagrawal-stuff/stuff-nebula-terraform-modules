data "akamai_contract" "contract" {
  group_name = var.akamai_group_name
}

data "akamai_group" "group" {
  group_name = var.akamai_group_name
  contract_id = data.akamai_contract.contract.id
}

resource "akamai_cp_code" "cp_code" {
  name     = var.cp_code_name
  contract_id        = data.akamai_contract.contract.id
  group_id           = data.akamai_group.group.id
  product_id  = var.product_id
}