terraform {
  required_version = ">= 0.13.0"

  required_providers {
    aws   = "~> 3.71.0"
    null  = "~> 3.1.0"
    local = "~> 2.1.0"
  }
}

provider "aws" {
  region  = var.region
  profile = var.aws_cli_profile
}

provider "null" {}

provider "local" {}


