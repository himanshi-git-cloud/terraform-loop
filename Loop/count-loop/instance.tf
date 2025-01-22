terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.82.2"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}


resource "aws_instance" "my-instance" {
  count = 3
  ami           ="ami-053b12d3152c0cc71"
  instance_type = "t2.micro"
  key_name      ="mumbai-key"
  
   
  tags = {
    Name = "my-instance"
    Env     = terraform.workspace
  }
}

