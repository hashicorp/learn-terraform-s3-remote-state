# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

output "s3_bucket_name" {
  value = aws_s3_bucket.terraform_state.id
}

output "dynamodb_endpoint" {
  value = aws_dynamodb_table.terraform_state_lock.name
}