variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type    = string
  default = "my-eks-cluster"
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
