# Sets terraform version and AWS provider version
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.9.0"
    }
  }
  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

# Creates bucket, name of variable set through variables.tf
# info stored in variable set in .tfvars

resource "aws_s3_bucket" "my-bucket" {
  bucket = var.my_bucket
  acl    = "private"

  versioning {
    enabled = true
  }

  tags = {
    Name   = var.my_bucket
    Cohort = "mar-2024-cloud-engineering"
  }
}

# Creates instance, name of variable set through variables.tf
# info stored in variable set in .tfvars
resource "aws_instance" "app_server" {
  ami           = "ami-0648ea225c13e0729"
  instance_type = "t2.micro"

  tags = {
    Name   = var.instance_name
    Cohort = "mar-2024-cloud-engineering"
  }
}
