output "repository_urls" {
  description = "Map repo_name => repository URL"
  value       = { for k, v in aws_ecr_repository.this : k => v.repository_url }
}

output "role_arn" {
  description = "IAM role ARN with AdministratorAccess"
  value       = aws_iam_role.devops_ecr.arn
}
