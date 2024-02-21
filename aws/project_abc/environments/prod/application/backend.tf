terraform {
  backend "s3" {
    bucket = "project-abc-tfstate-bucket"
    key    = "state/environment/prod/application/terraform.tfstate"
    region = "eu-west-1"
    encrypt    = true

  }
}
