terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}
resource "aws_subnet" "priv-subnet" {
    availability_zone = var.az
    cidr_block = var.cidr
    vpc_id = var.vpc-id
    tags = var.tags
}