resource "aws_s3_bucket" "LMSFRONTEND" {
    bucket = "${var.lmsfrontbuck}" 
    acl = "${var.acl_value}"   
}
