terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.50.0"
    }
  }
}
provider "aws" {
    region= var.region
}

resource "aws_vpc" "vpc-1" {
    cidr_block = var.cidr
    tags = var.tags
}