
output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}



output "cluster_name" { value = module.eks.cluster_name }
output "cluster_endpoint" { value = module.eks.cluster_endpoint }
output "cluster_oidc_issuer" { value = module.eks.cluster_oidc_issuer }
output "nodegroup_role_arn" { value = module.eks.nodegroup_role_arn }
output "vpc_id" { value = module.eks.vpc_id }
output "private_subnets" { value = module.eks.private_subnets }
output "public_subnets" { value = module.eks.public_subnets }
output "intra_subnets" { value = module.eks.intra_subnets }
