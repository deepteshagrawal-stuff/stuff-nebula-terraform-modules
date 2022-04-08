data "aws_caller_identity" "current" {}

module "app_service_account" {
  source             = "github.com/StuffNZ/stuff-nebula-terraform-modules//stuff-nebula-sa-role"
  name               = var.name
  oidc_issuer_url    = var.oidc_issuer_url
  namespace          = var.namespace
  cluster_account_id = data.aws_caller_identity.current.account_id
}

resource "aws_iam_role_policy" "policies" {
  count  = length(var.policies)
  role   = module.app_service_account.id
  name   = var.policies[count.index].name
  policy = file(var.policies[count.index].path)
}
