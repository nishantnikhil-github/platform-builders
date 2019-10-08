provider "aws" {
  region = "eu-west-2"
}

resource "aws_security_group" "pb-sg" {
  name = "pb-sg"
  tags = {
    Name  = "Platform Builders SG"
    owner = var.owner
  }
  ingress {
    from_port   = var.from_port
    to_port     = var.to_port
    protocol    = "tcp"
    cidr_blocks = ["185.46.212.0/22"]
  }
  ingress {
    from_port   = "22"
    to_port     = "22"
    protocol    = "tcp"
    cidr_blocks = ["185.46.212.0/22"]
  }
  egress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

/*resource "random_id" "myrandom" {
  byte_length = 3
}*/
