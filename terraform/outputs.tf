output "eks_cluster_endpoint" {
  value = module.eks.cluster_endpoint
}

output "eks_cluster_name" {
  value = module.eks.cluster_name
}

output "ec2_instance_id" {
  value = module.ec2_instance.instance_id
}

output "ec2_instance_public_ip" {
  value = module.ec2_instance.public_ip
}

output "backend_bucket" {
  value = var.backend_bucket
}

output "backend_dynamodb_table" {
  value = var.backend_dynamodb_table
}
