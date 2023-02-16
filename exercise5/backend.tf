terraform {
  backend "s3" {
    bucket = "terraformbackendstore"
    key = "terraform/backend"
    region = "us-east-1"
}
}
