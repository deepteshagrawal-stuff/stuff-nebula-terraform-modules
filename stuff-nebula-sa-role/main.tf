resource "aws_iam_role" "app_service_account" {
  name = "EKS-ServiceAccount-Role-${var.name}"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::${data.aws_caller_identity.current.account_id}:oidc-provider/${var.oidc_issuer_url}"
          },
          "Action" : "sts:AssumeRoleWithWebIdentity",
          "Condition" : {
            "StringEquals" : {
              "${var.oidc_issuer_url}:aud" : "sts.amazonaws.com",
              "${var.oidc_issuer_url}:sub" : "system:serviceaccount:${var.namespace}:${var.name}"
            }
          }
        }
      ]
  })

  tags = {
    Name = "EKS-ServiceAccount-Role-${var.name}"
  }
}
