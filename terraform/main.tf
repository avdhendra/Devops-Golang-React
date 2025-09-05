

module "ec2_instance" {
  source = "./infra-app/ec2"

  name           = var.ec2_name
  ami            = var.ec2_ami
  instance_type  = var.ec2_instance_type
  my_key_pair    = var.my_key_pair
  my_pub_key     = var.my_pub_key
  my_env         = var.my_env
  volume_size    = var.volume_size
  volume_type    = var.volume_type
  ingress_rules  = var.ingress_rules
  my_private_key = var.my_private_key
}



module "eks" {
  source = "./infra-app/eks"

  name   = var.name
  my_env = var.my_env

  # networking
  vpc_cidr        = var.vpc_cidr
  azs             = var.azs
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets
  intra_subnets   = var.intra_subnets

  # eks
  cluster_version     = var.cluster_version
  node_instance_types = var.node_instance_types
  node_desired_size   = var.node_desired_size
  node_min_size       = var.node_min_size
  node_max_size       = var.node_max_size
  capacity_type       = var.capacity_type
  enable_public_api   = var.enable_public_api

  attach_admin_policy_to_nodes = var.attach_admin_policy_to_nodes
}



module "ecr_simple" {
  source       = "../infra/ecr"
  repo_names   = var.repo_names
  role_name    = var.role_name
  force_delete = var.force_delete
  common_tags  = var.common_tags
}