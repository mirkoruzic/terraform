module "db_secrets" {
  source = "../../../modules/aws_secret_manager"
  environment_name = var.env
}
