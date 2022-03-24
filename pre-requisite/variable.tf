variable "s3_backend_bucket" {
  type        = string
  description = "s3 terraform backend"
}

variable "dynamodb_lock_table" {
  type        = string
  description = "DynamoDB table to acquire terraform  state lock"
}

variable "region" {
  type        = string
  description = "The region in which infra to be deployed"
}

#variable "client_name" {
#  type        = string
#  description = "The display name of the alias. The name must start with the word `alias` followed by a forward slash. If not specified, the alias name will be auto-generated."
#}

variable "account_id" {
  type        = number
  description = "The account ID of AWS"
}

variable "aws_cli_profile" {
  type        = string
  description = "The credential using which infra to be deployed"
}
