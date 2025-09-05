module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.31"

  cluster_name                   = var.name
  cluster_version                = var.cluster_version
  cluster_endpoint_public_access = var.enable_public_api

  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.intra_subnets

  cluster_addons = {
    vpc-cni    = { most_recent = true }
    kube-proxy = { most_recent = true }
    coredns    = { most_recent = true }
  }

  eks_managed_node_group_defaults = {
    instance_types                = var.node_instance_types
    attach_primary_security_group = true
    capacity_type                 = var.capacity_type
  }

  eks_managed_node_groups = {
    "${var.name}-ng" = {
      desired_size = var.node_desired_size
      min_size     = var.node_min_size
      max_size     = var.node_max_size

      iam_role_additional_policies = var.attach_admin_policy_to_nodes ? {
        administrator = "arn:aws:iam::aws:policy/AdministratorAccess"
      } : {}
    }
  }

  tags = {
    Environment = var.my_env
    Terraform   = "true"
    Project     = var.name
  }
}
