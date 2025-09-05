variable "name" { type = string }
variable "my_env" { type = string }

variable "vpc_cidr" { type = string }
variable "azs" { type = list(string) }
variable "private_subnets" { type = list(string) }
variable "public_subnets" { type = list(string) }
variable "intra_subnets" { type = list(string) }

variable "cluster_version" { type = string }
variable "node_instance_types" { type = list(string) }
variable "node_desired_size" { type = number }
variable "node_min_size" { type = number }
variable "node_max_size" { type = number }
variable "capacity_type" { type = string }
variable "enable_public_api" { type = bool }

variable "attach_admin_policy_to_nodes" { type = bool }
