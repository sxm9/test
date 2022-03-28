terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws   = "~> 3.71.0"
    null  = "~> 3.1.0"
    local = "~> 2.1.0"
  }
  
  backend "s3" {
    key     = "terraform.tfstate"
    encrypt = true
    #kms_key_id = ""
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_cli_profile
}

provider "null" {}

provider "local" {}


resource "aws_cloudwatch_event_rule" "trigger_sf_raw_to_parquet_trigger" {
  name                = "${var.client_name}-${var.lambda_name}"
  description         = "Trigger lambda" 
  schedule_expression = "rate(5 minutes)"
  is_enabled          = true

  tags = {
    "tenant" = var.client_name
  }
}


#####################################
# Variables
#####################################

variable "region" {
  type        = string
  description = "The region in which infra to be deployed"
}

variable "aws_cli_profile" {
  type        = string
  description = "The credential using which infra to be deployed"
}

variable "client_name" {
  type        = string
  description = "The tenant name for which infra to be deployed"
}

variable "lambda_name" {
  type        = string
  description = "The lambda name to be deployed"
}
