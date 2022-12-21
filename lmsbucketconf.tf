provider "aws" {
    access_key = "${var.aws_access_key}"
    secret_key = "${var.aws_secret_key}"
    region = "us-west-2"
}

module "s3" {
    source = "terraform-aws-modules/s3-bucket/aws"
    #bucket name should be unique
    #bucket_name = "lmsfrontbuck"       
}
