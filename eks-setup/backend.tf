terraform {
  backend "s3" {
    key = "platform-builder-eks-cluster-nonprod/terraform.tfstate"
  }
}
