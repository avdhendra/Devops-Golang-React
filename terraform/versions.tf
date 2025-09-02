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
    region         = "eu-central-1"
    use_lockfile= true

  }


}

