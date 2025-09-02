terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.91.0"
    }
  }
  backend "s3" {
    bucket         = "my-tf-test-bucket"
    key            = "terraform.tfstate"
    region         = "eu-central-1"               # Match the actual S3 bucket region
    dynamodb_table = "tws-junnon-state-table"     # Still valid for state locking
    encrypt        = true

  }


}

