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

resource "aws_key_pair" "key_pair" {
  key_name   = "${var.client_name}-${var.key_pair_name}"

  tags = {
    "tenant" = "${var.client_name}",
    "use"    = "${var.client_name} ssh key pair"
  }
}


variable "client_name" {
  type        = string
  description = "The tenant name for which infra to be deployed"
}

variable "key_pair_name" {
  type        = string
  description = "The tenant name for which infra to be deployed"
}

