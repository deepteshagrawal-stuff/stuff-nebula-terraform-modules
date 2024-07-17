data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = [var.role_service]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "role" {
  count              = var.create_role ? 1 : 0
  name               = var.role_name
  description        = var.role_description
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  dynamic "inline_policy" {
    for_each = var.role_inline_policies

    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy_document
    }
  }
}

data "aws_iam_policy_document" "allow_policy" {
  statement {
    effect    = "Allow"
    actions   = [
      for action in var.allow_policy_actions : action
    ]
    resources = [
      for resource in var.allow_policy_resources : resource
    ]
  }
}

resource "aws_iam_policy" "policy" {
  count       = var.create_policy ? 1 : 0
  name        = var.policy_name
  description = var.policy_description
  policy      = data.aws_iam_policy_document.allow_policy.json
}

resource "aws_iam_role_policy_attachment" "role_policy_attach" {
  count      = var.create_policy_attachment ? 1 : 0
  role       = var.create_role ? aws_iam_role.role[count.index].name : var.role_to_attach
  policy_arn = var.create_policy ? aws_iam_policy.policy[count.index].arn : var.policy_to_attach
}
