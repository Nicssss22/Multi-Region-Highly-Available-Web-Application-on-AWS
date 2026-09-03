# Let the GitHub role authenticate and push to both repositories.
resource "aws_iam_role_policy" "github_ecr" {
  name = "push-regional-images"
  role = aws_iam_role.github_actions.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecr:GetAuthorizationToken"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["ecr:BatchCheckLayerAvailability", "ecr:BatchGetImage", "ecr:CompleteLayerUpload", "ecr:InitiateLayerUpload", "ecr:PutImage", "ecr:UploadLayerPart"]
        Resource = [aws_ecr_repository.east.arn, aws_ecr_repository.west.arn]
      }
    ]
  })
}