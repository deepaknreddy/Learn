module "vpc-prod" {
    source = "../modules/vpc"
    region = "ap-south-1"
    cidr = "10.0.0.0/16"
    tags = {
        Name = "vpc-1"
    }
}
module "public-subnet" {
    source = "../modules/pub-subnet"
    az = "ap-south-1a"
    cidr = var.cidr[count.index]
    vpc-id = module.vpc-prod.id
    tags = {
        Name = "public-subnet-${count.index}"
    }
    count = 2
}

resource "aws_route_table" "route-table" {
    vpc_id = module.vpc-prod.id
    tags = var.tags[count.index]
    # route {}
    count =2
}
variable "tags" {
    default = [{
            Name = "rtb-test-1"
        },
        {
            name = "rtb-test-2"
        }]
}

module "aws_route_table_association" {
    source = "../modules/route-table"
    count = 2
    vpc-id = module.vpc-prod.id
    tags = {
    #    Name = "rtb-${count.index}"
    Name = "rtb-${count.index}"
    }
    subnet-id = module.public-subnet[count.index].id
    rtb-id = aws_route_table.route-table[count.index].id

}