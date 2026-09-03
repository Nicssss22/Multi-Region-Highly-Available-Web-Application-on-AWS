# Print the non-secret values used by the deployment workflow.
output "aws_role_arn" {
  value = aws_iam_role.github_actions.arn
}
output "ecs_execution_role_arn" {
  value = aws_iam_role.task_execution.arn
}
output "ecs_infrastructure_role_arn" {
  value = aws_iam_role.infrastructure.arn
}
output "ecr_east_uri" {
  value = aws_ecr_repository.east.repository_url
}
output "ecr_west_uri" {
  value = aws_ecr_repository.west.repository_url
}