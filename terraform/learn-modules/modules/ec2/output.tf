output "ec2-public-ip" {
    value = aws_instance.ec2-server.public_ip
}