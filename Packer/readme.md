

Packer is a tool thats allows us to create custom images that can be used for deployments on AWS, Azure, GCP, VMware, Docker.

Packer helps us in provisioning immutable(avoid mutating) instances.
i.e. to create a image with all the necessary changes(os,application,security, etc) in the image itself to avoid configuration drift.

If we want to make any changes(update/patch the application), we create new image with necessary changes then we spin up instances with new image and takedown instances with old image,so we dont have to modify the old image everytime.
i.e. deploying finalised and complete image everytime.


when packer runs there is going to be 3 stages:
1.Builder stage  
- responsible creating the image(most important)
- for every plotform there is different builder
- here we specify base ami i.e. source image
- builder takes the base image and deploys an instance
2.Provisioner stage  
- this step is to configure and modify the instance
- set of instructions ae provided to customise the image(like shell script to install and start nginx,deploy application, goit clone etc)

after this stage a snapshot of the ami is taken to create a new ami.

3.post-processors stage
- post-processors are run after builders and provisioners and can be used to upload artifacts,compress and repackage files/images.

PACKER CAN DO ALL OF THIS BY USING 1 SINGLE CONFIG FILE AND WITH A SINGLE COMMAND.

packer files should have '.pkr.hcl' extension, eg: aws-ubuntu.pkr.hcl


packer documentation: https://developer.hashicorp.com/packer/docs   https://developer.hashicorp.com/packer/plugins

there choose amazon ec2(you will have builders, data source and post-processor)

packer file:

vi aws-linux.pkr.hcl

#this provider block can be found under builders>overview in documentation
```
packer {
  required_plugins {
    amazon = {
      version = ">= 1.2.6"
      source = "github.com/hashicorp/amazon"
    }
  }
}

source "amazon-ebs" "linux-ami" {        #this is builder
access_key = "string"
secret_key = "string1"
ami_name =
region =
instance_type =
source_ami =
ssh_username =
}

build {
name = "my-nginx-kalyan"
sources = ["source.amazon-ebs.linux-ami"]

provisioner "shell" {     #many pther options like shell are available
inline = ["sudo yum install epel-release -y",
"sudo yum install nginx -y",
"sudo service nginx start",
"sudo systemctl enable nginx"
]
}

post-processor "vagrant" {}
post-processor "compress" {}

}

#vagrant takes the ami created on amazon and make it accessable locally ,
#compress takes the output of vagrant and compress it to .tar.zip
```
packer commands:
packer init .   // dot represents present directory, this command downloads plugins

packer fmt .    //formats the content of files same like terraform fmt,it aligns the spaces and brackets

packer validate .   //like syntax check

packer build filename
eg: packer build aws-ubuntu.pkr.hcl  // this command will spinup and ec2 instances with temporary keys, then execute the cammands and build new image from it and then terminate that instance.
