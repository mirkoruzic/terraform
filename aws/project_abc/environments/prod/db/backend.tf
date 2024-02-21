terraform {
  backend "s3" {
    bucket = "abc-tfstate-bucket" # Replace with your S3 bucket name
    key    = "state/environment/prod/db/terraform.tfstate"
    region = "eu-west-1"
    encrypt    = true

  }
}
