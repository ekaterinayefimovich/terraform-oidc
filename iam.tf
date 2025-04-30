

resource "aws_iam_role" "github_oidc_provider_role" {  
  name = "github-oidc-provider-role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect = "Allow",
        Principal = {
          Federated = module.github-oidc.oidc_provider_arn
        },
        Action = "sts:AssumeRoleWithWebIdentity",
        Condition = {
          StringEquals = {
            "token.actions.githubusercontent.com:aud" = "sts.amazonaws.com"
          },
          StringLike = {
            "token.actions.githubusercontent.com:sub" = "repo:ekaterinayefimovich/terraform-oidc:*"
          }
        }
      }
    ]
  })
}

resource "aws_iam_policy" "github_oidc_provider_policy" {
  name = "github-oidc-provider-full-access"
  policy = jsonencode({
    Version = "2012-10-17",
    Statement = [
      {
        Effect   = "Allow",
        Action   = "*",
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "github_oidc_provider_policy_attachment" {
  role       = aws_iam_role.github_oidc_provider_role.name
  policy_arn = aws_iam_policy.github_oidc_provider_policy.arn
}

