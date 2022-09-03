provider "aws" {
  region = "us-east-1"
}
resource "aws_instance" "ec2-server" {
    ami = var.ami
    instance_type = "t2.medium"
    key_name = "aws-key"

}