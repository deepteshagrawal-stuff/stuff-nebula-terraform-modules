resource "aws_iam_user" "user" {
  name        = var.name
}

resource "aws_iam_access_key" "user_access_key" {
  user        = aws_iam_user.user.name
}

data "aws_iam_policy_document" "sender_policy_doc" {
  statement {
    actions   = ["ses:SendRawEmail"]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "sender_policy" {
  name        = var.policy_name
  description = var.description
  policy      = data.aws_iam_policy_document.sender_policy_doc.json
}

resource "aws_iam_user_policy_attachment" "attatch_policy" {
  user       = aws_iam_user.user.name
  policy_arn = aws_iam_policy.sender_policy.arn
}
