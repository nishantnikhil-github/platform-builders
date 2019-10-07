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
  key_name   = "oli-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDVNvIJtNjLUuzbs6qVAceFMnqwNaRnq36wamUTspSJV7uG0+k2HKcul7x0p7Ejuj0Gvx+zgRytJV8HID/d0iWyKQkvMZjHn5ZY3ckFTCMa2mkx4OBQJl6nimxGmTv9uXgctviMbYlFwJtWz/XJY9IyXwDKII77RfIKKcUbKz2NDcjY81PHSFm7gcACmQ8jZjnizCI9Ha9t5x48lS7GQl1+1Mmb2gxHFzEh0R7W+ux/oGJ+C/D/5XltbLl/0Y2F6TMP72yKwz2dwQxcNpqYMyLV9IRfpNzUS9bl8bMyixZJUzkpaGrYeZU6fBlqWvwQ7TMXdzGcOON8ht+vPTxnNkE3"
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
