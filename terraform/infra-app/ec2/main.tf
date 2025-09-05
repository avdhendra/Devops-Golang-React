resource "aws_key_pair" "deployer" {
  key_name   = var.my_key_pair
  public_key = file(var.my_pub_key)
}

resource "aws_default_vpc" "default" {}

resource "aws_security_group" "allow_user_to_connect" {
  name        = "${var.my_env}-allow-access"
  description = "Allow inbound traffic for ${var.my_env}"
  vpc_id      = aws_default_vpc.default.id

  dynamic "ingress" {
    for_each = var.ingress_rules
    content {
      description = ingress.value.description
      from_port   = ingress.value.from_port
      to_port     = ingress.value.to_port
      protocol    = ingress.value.protocol
      cidr_blocks = ingress.value.cidr_blocks
    }
  }

  egress {
    description = "Allow all outbound traffic"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.my_env}-sg"
  }
}

resource "aws_iam_role" "devops_role" {
  name = "devops-user"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
        Action = "sts:AssumeRole"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "admin_policy" {
  role       = aws_iam_role.devops_role.name
  policy_arn = "arn:aws:iam::aws:policy/AdministratorAccess"
}

resource "aws_iam_instance_profile" "devops_profile" {
  name = "devops-instance-profile"
  role = aws_iam_role.devops_role.name
}

resource "aws_instance" "my_app_server" {
  ami                  = var.ami
  instance_type        = var.instance_type
  key_name             = aws_key_pair.deployer.key_name
  iam_instance_profile = aws_iam_instance_profile.devops_profile.name
  vpc_security_group_ids = [aws_security_group.allow_user_to_connect.id]

  root_block_device {
    volume_size = var.volume_size
    volume_type = var.volume_type
  }

  tags = {
    Name = var.name
  }
   
}

resource "local_file" "ansible_inventory" {
  content  = <<EOT
[dev_server]
${aws_instance.my_app_server.public_ip} ansible_user=ubuntu ansible_ssh_private_key_file=../terraform/devops-key
EOT
  filename =  "${path.module}/../../../ansible/inventory.ini"
}

