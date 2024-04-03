terraform {

  # Sets AWS as the infrastructure provider 
  # as well as the required version to use
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region = "eu-west-2"
}

# Define variables (EC2 and Bucket)
variable "bucket_name" {
  description = "Name of the S3 bucket"
}

variable "instance_name" {
  description = "Name of the EC2 instance"
}

# Create S3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "team_dkr_bucket"

  tags = {
    Name   = "team_dkr_bucket"
    Cohort = "mar-2024-cloud-engineering"
  }
}

resource "aws_s3_bucket_versioning" "versioning_enabled" {
  bucket = "team_dkr_bucket"
  versioning_configuration {
    status = "Enabled"
  }
}

# versioning {
#     enabled = true
#   }
# }

# Create EC2 instance (resource just gives editable descriptor name for resources)
resource "aws_instance" "app_server" {
  ami           = "ami-0648ea225c13e0729"
  instance_type = "t2.micro"

  tags = {
    Name   = "team_dkr_instance"
    Cohort = "mar-2024-cloud-engineering"
  }
}
