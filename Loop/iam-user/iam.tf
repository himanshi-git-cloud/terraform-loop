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

# IAM Users resource block
resource "aws_iam_user" "my_users" {
  for_each = var.user_names

  name = each.key

  tags = {
    Name = each.key
    Env  = terraform.workspace
  }
}

variable "user_names" {
  default = {
    user1 = "ranju"
    user2 = "mahi"
    user3 = "himahi"
  }
}
