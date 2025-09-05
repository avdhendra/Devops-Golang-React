# --- ECR repositories (AES256, minimal) ---
resource "aws_ecr_repository" "this" {
  for_each = toset(var.repo_names)
  name     = each.value

  image_tag_mutability = "MUTABLE"

  encryption_configuration {
    encryption_type = "AES256"
  }

  force_delete = var.force_delete
  tags         = var.common_tags
}

# --- IAM role with AdministratorAccess (simple, as requested) ---
data "aws_iam_policy_document" "assume_role" {
  statement {
    effect  = "Allow"
    actions = ["sts:AssumeRole"]
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"] # attach as an instance profile if you want EC2 to push
    }
  }
}

resource "aws_iam_role" "devops_ecr" {
  name               = var.role_name
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
  tags               = var.common_tags
}

resource "aws_iam_role_policy_attachment" "admin_attach" {
  role       = aws_iam_role.devops_ecr.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}
