resource "aws_vpc" "my_vpc" {
    cidr_block = var.cidr
    instance_tenancy = var.tendency[0]
    tags = {
        name = "my-vpc"
    }
}
resource "aws_subnet" "my-subnet" {
    availability_zone = var.availability_zone[count.index%3]
    cidr_block = var.subnet-cidr[count.index]
    count = length(var.subnet-cidr)
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        "name" = "my-subnet"
    }
}
resource "aws_route_table" "my-route-table-pub" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        name = "my_route_table-pub"
    }
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw.id
    }

}
resource "aws_route_table_association" "pub-sub-routetbl" {
    subnet_id = aws_subnet.my-subnet[0].id
    route_table_id = aws_route_table.my-route-table-pub.id
}
resource "aws_route_table_association" "priv-sub-routetbl" {
    subnet_id = aws_subnet.my-subnet[1].id
    route_table_id = aws_route_table.my-route-table-priv.id
}
resource "aws_route_table" "my-route-table-priv" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        name = "my_route_table-priv"
    }
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat.id
    }
}


resource "aws_internet_gateway" "igw" {
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "igw-vpc"
    }
}
resource "aws_eip" "eip1" {
    vpc = true
}
resource "aws_nat_gateway" "nat" {
    allocation_id = aws_eip.eip1.id
    subnet_id = aws_subnet.my-subnet[0].id
    tags = {
        Name = "nat-g"
    }
}
resource "aws_security_group" "secg-pub" {
    name = "vpc-secg-pub"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "sec-group-pub"
    }
    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks =  ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks =  ["0.0.0.0/0"]
    }
}

resource "aws_security_group" "secg-priv" {
    name = "vpc-secg-priv"
    vpc_id = aws_vpc.my_vpc.id
    tags = {
        Name = "sec-group-priv"
    }
    ingress  {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.cidr]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = -1
        cidr_blocks = ["0.0.0.0/0"]
    }
}
resource "aws_instance" "public-instance" {
    ami = var.ami1
    instance_type = "t2.micro"
    associate_public_ip_address = true
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.secg-pub.id]
    subnet_id = aws_subnet.my-subnet[0].id
    count = var.ec2pub
    tags = {
        Name = "public-ec2-${count.index}"
    }
    user_data = data.local_file.f1.content
    user_data_replace_on_change = true
}
resource "aws_instance" "private-instance" {
    ami = var.ami1
    instance_type = "t2.micro"
    associate_public_ip_address = false
    key_name = var.key
    vpc_security_group_ids = [aws_security_group.secg-priv.id]
    subnet_id = aws_subnet.my-subnet[1].id
    count = var.ec2priv
    tags = {
        Name = "private-ec2-${count.index}"
    }
    user_data = data.local_file.f1.content
    user_data_replace_on_change = true
}
data "local_file" "f1" {
    filename = "userdata.txt"
}