

module "ec2_instance" {
  source = "./infra-app/ec2"

  name          = var.ec2_name
  ami           = var.ec2_ami
  instance_type = var.ec2_instance_type
  my_key_pair   = var.my_key_pair
  my_pub_key    = var.my_pub_key
  my_env        = var.my_env
  volume_size   = var.volume_size
  volume_type   = var.volume_type
  ingress_rules = var.ingress_rules
}
