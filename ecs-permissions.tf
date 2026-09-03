# Let the GitHub role create or update Express Mode services.
resource "aws_iam_role_policy" "github_ecs" {
  name = "deploy-express-services"
  role = aws_iam_role.github_actions.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect   = "Allow"
        Action   = ["ecs:CreateCluster", "ecs:RegisterTaskDefinition", "ecs:CreateExpressGatewayService", "ecs:UpdateExpressGatewayService", "ecs:DescribeExpressGatewayService", "ecs:DescribeClusters", "ecs:DescribeServices", "ecs:ListServiceDeployments", "ecs:DescribeServiceDeployments", "ecs:TagResource", "ecs:UntagResource"]
        Resource = "*"
      },
      {
        Effect   = "Allow"
        Action   = ["iam:PassRole"]
        Resource = [aws_iam_role.task_execution.arn, aws_iam_role.infrastructure.arn]
      }
    ]
  })
}