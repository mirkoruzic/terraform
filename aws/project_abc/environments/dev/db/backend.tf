terraform {
  backend "s3" {
    bucket = "project-abc-tfstate-bucket"
    key    = "state/environment/dev/db/terraform.tfstate"
    region = "eu-west-1"
    encrypt    = true

  }
}
