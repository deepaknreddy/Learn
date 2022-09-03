module "ec2-creation" {
    source = "../modules/ec2"
}
module "s3-creation" {
    source = "../modules/s3"
    bucket1 = "test-hit-git"
}