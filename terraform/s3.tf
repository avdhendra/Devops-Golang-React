
resource "aws_s3_bucket" "remote_s3" {
  bucket = var.backend_bucket

  tags = {
    Name        = "Terraform Backend Bucket"
    Environment = var.backend_environment
  }
}

# Enable versioning (so state history is preserved)
resource "aws_s3_bucket_versioning" "remote_s3_versioning" {
  bucket = aws_s3_bucket.remote_s3.id

  versioning_configuration {
    status = "Enabled"
  }
}


# Bucket policy allowing only specified principals (IAM users/roles)
data "aws_iam_policy_document" "remote_s3_policy" {
  statement {
    sid    = "AllowBackendAccess"
    effect = "Allow"

    principals {
      type        = "AWS"
      identifiers = var.backend_bucket_principals
    }

    actions = [
      "s3:GetObject",
      "s3:PutObject",
      "s3:DeleteObject",
      "s3:ListBucket"
    ]

    resources = [
      aws_s3_bucket.remote_s3.arn,
      "${aws_s3_bucket.remote_s3.arn}/*"
    ]
  }
}

resource "aws_s3_bucket_policy" "remote_s3_policy" {
  bucket = aws_s3_bucket.remote_s3.id
  policy = data.aws_iam_policy_document.remote_s3_policy.json
}