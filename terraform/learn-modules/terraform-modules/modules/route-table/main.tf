
resource "aws_route_table_association" "rtb-association" {
    subnet_id = var.subnet-id
    route_table_id = var.rtb-id

}