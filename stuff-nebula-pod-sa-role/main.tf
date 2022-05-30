resource "aws_iam_role" "app" {
  name = "EKS-ServiceAccount-Role-${var.name}-${var.environment}"

  assume_role_policy = jsonencode(
    {
      "Version" : "2012-10-17",
      "Statement" : [
        {
          "Effect" : "Allow",
          "Principal" : {
            "Federated" : "arn:aws:iam::${var.cluster_account_id}:oidc-provider/${var.oidc_issuer_url}"
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
    Name = "EKS-ServiceAccount-Role-${var.name}-${var.environment}"
  }
}
