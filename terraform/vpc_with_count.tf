# here count is used to create 4 aws instance with just 1 block, 4 instances - in public subnet , 4 in private subnet ,totoal 2 count in 2 blocks.
resource "aws_vpc" "my-new-vpc" {
  cidr_block           = "10.0.0.0/16"
  enable_dns_hostnames = true
  instance_tenancy     = "default"
  tags = {
    name = "my-new-vpc"
  }
}
resource "aws_subnet" "public-subnet-vpc" {
  availability_zone = "ap-south-1a"
  vpc_id            = aws_vpc.my-new-vpc.id
  depends_on = [
    aws_vpc.my-new-vpc,
    aws_internet_gateway.my-gateway
  ]
  cidr_block = "10.0.0.0/24"
}
resource "aws_subnet" "private-subnet-vpc" {
  availability_zone = "ap-south-1b"
  vpc_id            = aws_vpc.my-new-vpc.id
  cidr_block        = "10.0.1.0/24"
}
resource "aws_security_group" "public-scg-vpc" {
  name   = "public-scg-vpc"
  vpc_id = aws_vpc.my-new-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "private-scg-vpc" {
  name   = "private-scg-vpc"
  vpc_id = aws_vpc.my-new-vpc.id
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [aws_vpc.my-new-vpc.cidr_block]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "all"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_internet_gateway" "my-gateway" {
  vpc_id = aws_vpc.my-new-vpc.id
  tags = {
    name = "igw-vpc"
  }
}
resource "aws_route_table" "public-rtb" {
  vpc_id = aws_vpc.my-new-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.my-gateway.id
  }
}
resource "aws_route_table_association" "subnet-association-pub" {
  subnet_id      = aws_subnet.public-subnet-vpc.id
  route_table_id = aws_route_table.public-rtb.id
}
resource "aws_route_table" "private-rtb" {
  vpc_id = aws_vpc.my-new-vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat-public-vpc.id
  }
}
resource "aws_route_table_association" "subnet-association-priv" {
  subnet_id      = aws_subnet.private-subnet-vpc.id
  route_table_id = aws_route_table.private-rtb.id
}
resource "aws_nat_gateway" "nat-public-vpc" {
  allocation_id     = aws_eip.eip-vpc.id
  connectivity_type = "public"
  subnet_id         = aws_subnet.public-subnet-vpc.id
  tags = {
    name = "public nat"
  }
}
resource "aws_eip" "eip-vpc" {
  vpc = true
}
resource "aws_instance" "new-instance-pub-vpc" {
  ami                         = "ami-0667149a69bc2c367"
  associate_public_ip_address = true
  instance_type               = "t2.micro"
  key_name                    = "mumbai-key"
  subnet_id                   = aws_subnet.public-subnet-vpc.id
  vpc_security_group_ids      = [aws_security_group.public-scg-vpc.id]
  count = 4
}
resource "aws_instance" "new-instance-priv-vpc" {
  ami                    = "ami-0667149a69bc2c367"
  instance_type          = "t2.micro"
  key_name               = "mumbai-key"
  subnet_id              = aws_subnet.private-subnet-vpc.id
  vpc_security_group_ids = [aws_security_group.private-scg-vpc.id]
  count =4
}
