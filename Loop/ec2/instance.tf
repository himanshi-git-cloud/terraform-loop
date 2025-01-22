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

resource "aws_instance" "my_instance" {
  for_each = var.instance_type

  ami           = "ami-053b12d3152c0cc71"
  instance_type = each.value
  key_name      = "mumbai-key"

  tags = {
    Name = "instance-${each.key}"
    Env  = terraform.workspace
  }
}

variable "instance_type" {
  default = {
    small  = "t2.micro"
    micro  = "t2.micro"
    medium = "t2.medium"
  }
}
