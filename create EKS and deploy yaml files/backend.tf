terraform {
  backend "s3" {
    bucket = "cicd-terraform-eks"
    region = "us-east-1"
    key    = "eks/terraform.tfstate"
  }
}