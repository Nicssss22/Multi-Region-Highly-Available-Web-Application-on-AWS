# Restrict OIDC access to this repository and its main branch.
variable "github_owner" { type = string }
variable "github_owner_id" { type = string }
variable "github_repo_id" { type = string }
variable "existing_oidc_provider_arn" { type = string }

locals {
  github_subject    = format("repo:%s@%s/multi-region-app@%s:ref:refs/heads/main", var.github_owner, var.github_owner_id, var.github_repo_id)
  oidc_provider_arn = var.existing_oidc_provider_arn != "" ? var.existing_oidc_provider_arn : aws_iam_openid_connect_provider.github[0].arn
}