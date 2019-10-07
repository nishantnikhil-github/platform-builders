provider "aws" {
  region = "eu-west-2"
}

#basic example of creating s3 bucket
resource "aws_s3_bucket" "platform-builders-terraform" {
  bucket = var.bucket_name
  region = "eu-west-2"
  tags = {
    Name  = var.name_tag
    Owner = var.owner_tag
  }

}
