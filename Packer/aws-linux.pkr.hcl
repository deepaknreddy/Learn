packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source  = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "linux-ami" {
  ami_name      = "test-deepu"
  region        = "ap-south-1"
  instance_type = "t2.micro"
  source_ami    = "ami-008b85aa3ff5c1b02"
  ssh_username  = "ec2-user"
}

build {
  name    = "my-httpd-kalyan"
  sources = ["source.amazon-ebs.linux-ami"]

  provisioner "shell" {
    inline = [
      "sudo yum install httpd -y",
      "sudo service httpd start",
      "sudo systemctl enable httpd"
    ]
  }
post-processor "vagrant" {}
post-processor "compress" {}
}
