resource "aws_internet_gateway" "internet-gateway" {
    vpc_id = var.vpc-id
    tags = var.tags
}