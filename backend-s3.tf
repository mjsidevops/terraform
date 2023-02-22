terraform {
  backend "s3" {
    bucket = "terraformbackendstore"
    key = "terraform/backen-vprofile-stack"
    region = "us-east-1"
}
}