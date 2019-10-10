terraform {
  backend "s3" {
    key = "platform-builder-eks-cluster-prod/terraform.tfstate"
  }
}
