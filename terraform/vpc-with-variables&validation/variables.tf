variable "cidr" {
    type = string
    default = "10.0.0.0/16"
    description = "vpc cidr range"
    validation {
      condition = can(regex("^10.0.",var.cidr))
      error_message = "var.cidr should start with '10.0.'"
    }
}
variable "tendency" {
    default = ["default","dedicated"]
    description = "instance_tendency of vpc"
}
variable "availability_zone" {
    default = ["ap-south-1a","ap-south-1b","ap-south-1c"]
    description = "availability zone of subnet"
}
variable "subnet-cidr" {
    default = ["10.0.0.0/28","10.0.1.0/28"]
    description = "cidr range of subnet"
}



variable "ami1" {
    default = "ami-0667149a69bc2c367"
    description = "ami of private and public instance"
    validation {
      condition = can(regex("^ami-",var.ami1))
      error_message = "var.ami1 should always start with 'ami-' "
    }
}
variable "key" {
    default = "mumbai-key"
    description = "name of the pem file for both private and public instance"
}
variable "ec2pub" {
    default = 4
    description = "no of ec2 public instances"
    type = number
}
variable "ec2priv" {
    default = 4
    description = "no of ec2 public instances"
    type = number
}