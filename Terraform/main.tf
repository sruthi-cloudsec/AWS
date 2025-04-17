provider "aws" {
  region     = var.aws_region
  access_key = var.aws_access_key
  secret_key = var.aws_secret_key
}

resource "aws_s3_bucket" "my_bucket" {
bucket = var.bucket_name
acl = "private"
tags = {
   Name     = var.bucket_name
   Environment = "Dev"
 }
}

resource " aws_iam_role" "s3_access_role" {
name = "S3AccessRole"

assume_role_policy = jsonencode({
   Version = "2012-10-17",
    Statement = [{
      Action = "sts:AssumeRole",
      Effect = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
     }
   }]
 })
}


resource "aws_iam_role_policy" "S3_access_policy" {
   name = "AllowS3"
   role = aws_iam_role.s3_access_role.id

   policy = jsonencode({
    Version = 2012-10-17",
    Satement = [{
     Action = ["s3:*"]",
      Effect = "Allow",
     Resource = "*"
   }]
 })
}

  

