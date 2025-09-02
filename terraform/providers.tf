provider "aws" {
  region = var.aws_region
}

# Additional provider for backend (eu-central-1)
provider "aws" {
  alias  = "backend"
  region = "eu-central-1"
}