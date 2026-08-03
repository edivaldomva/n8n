terraform {
  required_version = ">= 1.5"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

# Bucket S3
resource "aws_s3_bucket" "bucket" {
  bucket = "meu-bucket-exemplo-123456789"

  tags = {
    Name        = "MeuBucket"
    Environment = "Dev"
  }
}

# Security Group
resource "aws_security_group" "ec2_sg" {
  name        = "ec2-sg"
  description = "Permite SSH"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Apenas para laboratório
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# EC2
resource "aws_instance" "ec2" {
  ami           = "ami-0c02fb55956c7d316" # Amazon Linux 2 (exemplo para us-east-1)
  instance_type = "t2.micro"

  vpc_security_group_ids = [
    aws_security_group.ec2_sg.id
  ]

  tags = {
    Name = "MinhaEC2"
  }
}
