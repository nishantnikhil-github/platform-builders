terraform {
  backend "s3" {
    key = "jenkins-server/terraform.tfstate"
  }
}
