resource "aws_nat_gateway" "nat-gateway" {
    connectivity_type = "private"
    subnet_id = var.subnet-id
    tags = var.tags
}