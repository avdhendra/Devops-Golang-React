variable "name" {
  description = "Name tag for the EC2 instance"
  type        = string
}

variable "ami" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
}

variable "my_key_pair" {
  description = "Name of the key pair"
  type        = string
}

variable "my_pub_key" {
  description = "Public key value for the key pair"
  type        = string
}

variable "my_env" {
  description = "Environment (dev, staging, prod)"
  type        = string
}

variable "volume_size" {
  description = "Root volume size for EC2"
  type        = number
}

variable "volume_type" {
  description = "Root volume type for EC2"
  type        = string
}

variable "ingress_rules" {
  description = <<EOT
List of ingress rules to allow traffic.
Each rule must contain:
- description
- from_port
- to_port
- protocol
- cidr_blocks (list)
EOT
  type = list(object({
    description = string
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  }))
}
