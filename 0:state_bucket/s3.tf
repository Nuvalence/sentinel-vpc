resource "aws_s3_bucket" "tfstate" {
  acl                 = "private"
  bucket              = "ssentinellll-tfstate"
  acceleration_status = "Suspended"
  tags = {
    "contact" = "cbouscal"
    "project" = "sentinel"
  }
}

resource "aws_s3_bucket_public_access_block" "tfstate" {
  bucket              = aws_s3_bucket.tfstate.id
  block_public_acls   = true
  block_public_policy = true
}
