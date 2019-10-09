provider "aws" {
  region = "eu-west-2"
}

data "aws_ami" "pb_ami" {
  most_recent = true

  filter {
    name   = "name"
    values = ["platform-builders-jenkins"]
  }

  tags = {
    Name  = "Platform Builders AMI"
    owner = "Platform Builders"
  }

  owners = ["090107652998"]
}

resource "aws_key_pair" "nishant-key" {
  key_name   = "nishant-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDDOs48N+jce8dPxkM891AUsAdhQJApC5Fh34DM15F/twqnWcDlJ2oATIFgoejDi6nBWSXN+NxvOz+5men9x/CKJMvMZhXaxsNOCGvClYz9HI+gJETbydQ7yvI81QtYO/wcqV6VcYUaPCspyXlFPBhLN7XMYr5nJ3HqCq2fMAsYqdK6hTsXAlgOWsYUbO5NZd/ln0r2edzl26xdzF6qmYpMdRdx+4tZOrmelgF094EKYtRnxYpyj89wsYAxp0JXJsqN4ryFy3eeJFymFuXslL9fLUcQ6g9nEzEfq6cYE5MGCpf1p34fEh/auxkvwGsKSwN4kjgfnWcQFpb4f8MoZzaP nishant.nikhil@NishantNikhils-MacBook-Pro.local"
}

resource "aws_iam_role" "jenkins_role" {
  name = "jenkins_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      Name = "Platform-Builder"
  }
}

resource "aws_iam_instance_profile" "jenkins_profile-pb" {
  name = "jenkins_profile-pb"
  role = "${aws_iam_role.jenkins_role.name}"
}

resource "aws_iam_role_policy" "jenins_policy" {
  name = "jenkins_policy"
  role = "${aws_iam_role.jenkins_role.id}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": "*",
      "Resource": "*"
    }
  ]
}
EOF
}

resource "aws_instance" "webserver" {
  ami           = "${data.aws_ami.pb_ami.id}"
  instance_type = "t2.micro"
  iam_instance_profile = "${aws_iam_instance_profile.jenkins_profile-pb.name}"
  key_name = "nishant-key"
  security_groups = [
    var.my_security_group,
  ]
  tags = {
    Name  = "Platform Builders Jenkins Server"
    owner = "Platform Builders"
  }
}
