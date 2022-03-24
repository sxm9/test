resource "aws_s3_bucket" "raw_data" {
  bucket        = var.s3_backend_bucket
  acl           = "private"
  force_destroy = true

#  server_side_encryption_configuration {
#    rule {
#      apply_server_side_encryption_by_default {
#        kms_master_key_id = var.kms_key_arn
#        sse_algorithm     = "aws:kms"
#      }
#    }
#  }
#
  tags = {
    use = "storing terraform state file"
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.dynamodb_lock_table
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"
  attribute {
    name = "LockID"
    type = "S"
  }
  tags = {
   use = "table for terraform lock"
 }
}
