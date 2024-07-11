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
  name        = var.policy_name
  description = var.policy_description
  policy      = data.aws_iam_policy_document.allow_policy.json
}

resource "aws_iam_role_policy_attachment" "role_policy_attach" {
  role       = aws_iam_role.role.name
  policy_arn = aws_iam_policy.policy.arn
}
