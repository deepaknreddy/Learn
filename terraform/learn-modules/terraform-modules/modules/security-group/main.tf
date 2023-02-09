resource "aws_security_group" "sc-group" {
    # egress {}
    # ingress {}
    tags = var.tags
}
resource "aws_security_group_rule" "scg-rule" {
    type = var.type
    from_port = var.from-port
    to_port = var.to-port
    protocol = var.protocal
    security_group_id = var.sec-grp
}