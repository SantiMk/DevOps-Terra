terraform {
  required_providers {
    aws = {
        source  = "hashicorp/aws"
        version = "~> 6.68.0"
    }
  }

  backend "s3" {
    bucket                  = "devops-recipie"
    key                     = "tf-state-deploy"
    workspace_key_prefix    = "tf-state-deploy-env"
    region                  = "us-east-1"
    encrypt                 = true
    dynamodb_table          = "devops-recepie-api-erraform-lock"
  }
}

provider "aws" {
  region = "us-east-1"

  default_tags {
    tags = {
      Environment = terraform.workspace
      Project     = var.project
      contact     = var.contact
      ManageBy    = "Terraform/deploy"
    }
  }
}

local {
  prefix = "${var.prefix}-${terraform.workspace}"
}

data "aws-region" "current" {
  state = "available"
}