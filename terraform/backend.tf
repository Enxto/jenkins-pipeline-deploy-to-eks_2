terraform {
  backend "s3" {
    bucket = "etsi-tst-s3"
    region = "us-west-2"
    key = "eks/terraform.tfstate"
  }
}