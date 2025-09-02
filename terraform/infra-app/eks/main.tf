module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = "1.28"

  vpc_id     = var.vpc_id
  subnet_ids = var.subnet_ids

  manage_aws_auth = true

  node_groups = {
    workers = {
      desired_capacity = 2
      max_capacity     = 2
      min_capacity     = 2
      instance_types   = ["t3.medium"]
    }
  }

  tags = {
    Environment = "Terraform"
    Name        = var.cluster_name
  }
}

