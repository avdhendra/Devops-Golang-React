terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
}

backend "s3" {
  bucket         = var.backend_bucket
  key            = var.backend_key
  region         = var.backend_region
  dynamodb_table = var.backend_dynamodb_table

}
