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
  name               = var.role_name
  description        = var.role_description 
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  dynamic "inline_policy" {
    for_each = var.inline_policies

    content {
      name   = inline_policy.value.name
      policy = inline_policy.value.policy_document
    }
  }
}
