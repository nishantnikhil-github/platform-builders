provider "aws" {
  region = "eu-west-2"
}

resource "aws_iam_user" "platform-builders" {
  //count = "${length(var.username)}"
  //name = "${element(var.username,count.index )}"
  name = "test-accnt"
  tags = {
    Name = "Platform-Builder"
    Department = "Developer"
  }
  force_destroy = true
}

resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    "${aws_iam_user.user_one.name}",
    "${aws_iam_user.user_two.name}",
  ]

  group = "${aws_iam_group.group.name}"
}

resource "aws_iam_group" "group" {
  name = "test-group"
}

