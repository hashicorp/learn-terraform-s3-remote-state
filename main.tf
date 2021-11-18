provider "aws" {
  region = "us-west-1"
}

resource "aws_s3_bucket" "terraform_state" {
  bucket_prefix = "learn-s3-remote-backend-"

  versioning {
    enabled = true
  }

  force_destroy = true

  // lifecycle {
  //   prevent_destroy = true
  // }
}

resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = "terraform-state-lock-dynamo"
  read_capacity  = 1
  write_capacity = 1
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}