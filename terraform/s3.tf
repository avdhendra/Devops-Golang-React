resource "aws_s3_bucket" "remote_s3" {
  bucket = var.backend_bucket

  tags = {
    Name       = "My backend"
    Enviroment = "Dev"
  }
}

resource "aws_s3_bucket_versioning" "remote_s3_versioning" {
  bucket = aws_s3_bucket.remote_s3.id

  versioning_configuration {
    status = "Enabled"
  }
}
