/*provider "aws" {
  region = "eu-west-2"
}*/

/* data "aws_ami" "pb_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["platform-builders-jenkins"]
  }

  /*tags = {
    Name  = "Platform Build AMI"
    owner = var.owner
  }

  owners = [var.aws_account_owner]
}
*/

resource "aws_key_pair" "oli-key" {
  key_name   = var.
  public_key = var.
}

resource "aws_instance" "webserver" {
  ami           = "ami-0f7c83809e26276d0"
  instance_type = "t2.micro"
  /*iam_instance_profile = var.iam_role*/
  key_name = "oli-key"
  security_groups = [
    var.my_security_group
  ]
  tags = {
    Name  = "Platform Builders Jenkins Server"
    owner = var.owner
  }
}
