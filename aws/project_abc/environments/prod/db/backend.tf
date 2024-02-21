terraform {
  backend "s3" {
    bucket = "[SET_S3_BUCKET_FOR_TF_STATE]"  # Replace with your Terraform S3 TFState bucket
    key    = "state/environment/prod/db/terraform.tfstate"
    region = "eu-west-1"
    encrypt    = true

  }
}
