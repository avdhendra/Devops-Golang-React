resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.backend_dynamodb_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name       = "Terraform State Lock"
    Enviroment = "Dev"
  }
}
