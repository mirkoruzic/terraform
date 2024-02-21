terraform {
  backend "s3" {
    bucket = [SET_S3_BUCKET_FOR_TF_STATE]  # Replace with your S3 bucket name
    key    = "state/environment/dev/application/terraform.tfstate"
    region = "eu-west-1"
    encrypt    = true

  }
}
