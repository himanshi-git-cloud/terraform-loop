terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}
   
provider "aws" {
  region = "ap-south-1"
}

variable "bucket_names" {
  default = [
    "himanshi-loop-bucket-1",
    "himanshi-loop-bucket-2",
    "himanshi-loop-bucket-3"
  ]
}

resource "aws_s3_bucket" "buckets" {
  for_each = toset(var.bucket_names)

  bucket = each.value

  tags = {
    Name = each.value
    Env  = terraform.workspace
  }
}
 