resource "aws_s3_bucket" "remote_s3" {
  provider = aws.backend
  bucket   = var.backend_bucket

  tags = {
    Name       = "Terraform Backend Bucket"
    Environment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "remote_s3_versioning" {
  provider = aws.backend
  bucket   = aws_s3_bucket.remote_s3.id

  versioning_configuration {
    status = "Enabled"
  }
}

