output "cluster_name"        { value = module.eks.cluster_name }
output "cluster_endpoint"    { value = module.eks.cluster_endpoint }
output "cluster_oidc_issuer" { value = module.eks.cluster_oidc_issuer_url }

# Node group role ARN (useful if you want to attach more policies later)
output "nodegroup_role_arn" {
  value = module.eks.eks_managed_node_groups["${var.name}-ng"].iam_role_arn
}

# VPC outputs
output "vpc_id"          { value = module.vpc.vpc_id }
output "private_subnets" { value = module.vpc.private_subnets }
output "public_subnets"  { value = module.vpc.public_subnets }
output "intra_subnets"   { value = module.vpc.intra_subnets }
