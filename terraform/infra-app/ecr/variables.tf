variable "repo_names" {
  description = "ECR repository names to create"
  type        = list(string)
}

variable "role_name" {
  description = "Name of IAM role to create and attach AdministratorAccess"
  type        = string
  default     = "devops_ecr"
}

variable "force_delete" {
  description = "Force delete repo even if it has images (useful for dev)"
  type        = bool
  default     = false
}

variable "common_tags" {
  description = "Tags applied to all resources"
  type        = map(string)
  default     = {}
}
