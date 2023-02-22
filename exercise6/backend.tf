terraform {
  backend "s3" {
    bucket = "terraformbackendstore"
    key = "terraform/backend_exercise6"
    region = "us-east-1"
}
}
