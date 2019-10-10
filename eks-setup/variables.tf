#
# Variables Configuration
#

variable "cluster-name" {
  default = "nishant-terraform-eks-cluster-test"
  type    = "string"
}

variable "vpc-name" {
  default = "nishant-terraform-eks-node-test"
  type    = "string"
}

variable "eks-vpc-subnet" {
  default = "nishant-terraform-eks-node-test"
  type    = "string"
}

variable "eks-vpc-ig" {
  default = "nishant-terraform-eks-ig-test"
  type    = "string"
}

variable "nishant-terraform-eks-cluster-iam-role" {
  default = "nishant-terraform-eks-cluster-test"
  type    = "string"
}

variable "nishant-terraform-eks-cluster-sg" {
  default = "nishant-terraform-eks-cluster-test"
  type    = "string"
}

variable "nishant-terraform-eks-node-iam-role" {
  default = "nishant-terraform-eks-node-test"
  type    = "string"
}

variable "nishant-terraform-eks-node-sg" {
  default = "nishant-terraform-eks-node-sg-test"
  type    = "string"
}

variable "nishant-terraform-eks-lauch-config" {
  default = "nishant-terraform-eks-node-test"
  type    = "string"
}

variable "nishant-terraform-eks-asg" {
  default = "nishant-terraform-eks-node-test"
  type    = "string"
}
variable "nishant-terraform-eks-asg-name" {
  default = "nishant-terraform-eks-node-prod"
  type    = "string"
}

variable "nishant-terraform-eks-node-instance-profile" {
  default = "nishant-terraform-eks-node-prod"
  type    = "string"
}

variable "context-name" {
  default = "platform-builder-prod"
  type    = "string"
}