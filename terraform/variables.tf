variable "aws_region" {
  type    = string
  default = "us-east-1"
}



# EC2 variables
variable "ec2_name" {
  type = string
}
variable "ec2_ami" {
  type = string
}
variable "ec2_instance_type" {
  type = string
}
variable "my_key_pair" {
  type = string
}
variable "my_pub_key" {
  type = string
}
variable "my_private_key" {
  type = string
}
variable "my_env" {
  type = string
}
variable "volume_size" {
  type = number
}
variable "volume_type" {
  type = string
}
variable "ingress_rules" {
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}



# Backend variables
variable "backend_bucket" {
  description = "S3 bucket name for remote state"
  type        = string
}
variable "backend_key" {
  description = "State file key (path) in S3"
  type        = string
}
variable "backend_region" {
  description = "Region for backend S3 bucket"
  type        = string
}
variable "backend_dynamodb_table" {
  description = "DynamoDB table name for state locking"
  type        = string
}

variable "backend_environment" {
  description = "Environment tag for resources (e.g., Dev, Staging, Prod)"
  type        = string
}
variable "backend_bucket_principals" {
  description = "List of IAM principals allowed to access the backend bucket"
  type        = list(string)
}


#VPC AND EKS

variable "name" {
  type    = string
  default = "eks-cluster"
}


variable "vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "azs" {
  type    = list(string)
  default = ["eu-central-1a", "eu-central-1b"]
}

variable "private_subnets" {
  type    = list(string)
  default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "public_subnets" {
  type    = list(string)
  default = ["10.0.101.0/24", "10.0.102.0/24"]
}

variable "intra_subnets" {
  type    = list(string)
  default = ["10.0.5.0/24", "10.0.6.0/24"]
}

variable "cluster_version" {
  type    = string
  default = "1.31"
}

variable "node_instance_types" {
  type    = list(string)
  default = ["t2.medium"]
}

variable "node_desired_size" {
  type    = number
  default = 2
}

variable "node_min_size" {
  type    = number
  default = 2
}

variable "node_max_size" {
  type    = number
  default = 3
}

variable "capacity_type" {
  type    = string
  default = "SPOT" # or "ON_DEMAND"
}

variable "enable_public_api" {
  type    = bool
  default = true
}


variable "attach_admin_policy_to_nodes" {
  type    = bool
  default = false
}


#ECR



variable "repo_names" {
  type        = list(string)
  description = "ECR repositories to create"
}

variable "force_delete" {
  type    = bool
  default = false
}

variable "role_name" {
  type    = string
  default = "devops_ecr"
}

variable "common_tags" {
  type = map(string)
  default = {
    Terraform = "true"
    Env       = "dev"
    Project   = "socialnetwork"
  }
}
