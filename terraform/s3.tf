resource "aws_s3_bucket" "my-bucket-s3" {
  bucket = "my-terra-deepu-bucker"
  versioning {
    enabled = "true"
  }
  website {
    index_document = "index.html"
    error_document = "error.html"
  }
  tags = {
    name = "s3 my-bucket-s3 creation via terraform"
  }
  acl    = "public-read"
  policy = <<EOF
        {
        "Id": "Policy1660657836259",
        "Version": "2012-10-17",
        "Statement": [
        {
            "Sid": "Stmt1660657831367",
            "Action": "s3:*",
            "Effect": "Allow",
            "Resource": "arn:aws:s3:::my-terra-deepu-bucker/*",
            "Principal": "*"
        }
      ]
    }
    EOF
}
resource "aws_s3_object" "my-s3-object" {
    bucket = "my-terra-deepu-bucker"
    key = "test-1"
    source = "deepu.html"
}
resource "aws_s3_object" "my-html-object" {
    bucket = "my-terra-deepu-bucker"
    key = "index.html"
    source = "index.html"
    content_type = "text/html"
}


# ---
#Properties : 


#        - Bucker need to create as a public
#        - Enable Versioning
#        - Add tags to the bucket
#        - Enable static website setup 
#        - Upload few docs inside a bucket
#        - attach a policy to make the bucket objects as a public 
