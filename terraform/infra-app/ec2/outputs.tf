output "instance_id" {
  value = aws_instance.my_app_server.id
}

output "public_ip" {
  value = aws_instance.my_app_server.public_ip
}

output "security_group_id" {
  value = aws_security_group.allow_user_to_connect.id
}
