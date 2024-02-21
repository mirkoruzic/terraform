data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "[SET_S3_BUCKET_FOR_TF_STATE]"  # Replace with your Terraform S3 TFState bucket
    key    = "state/environment/${var.env}/network/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}

data "aws_secretsmanager_secret" "db_password" {
  name = "${var.env}-initial-db-password"

}

data "aws_secretsmanager_secret_version" "db_password" {
  secret_id = data.aws_secretsmanager_secret.db_password.id
}

module "rds" {
  source = "../../../modules/rds"

  db_subnet_group_name    = data.terraform_remote_state.network.outputs.db_subnet_group_name
  vpc_security_group_ids  = [data.terraform_remote_state.network.outputs.ecs_security_group, data.terraform_remote_state.network.outputs.rds_aurora_security_group]
  db_instance_class       = "db.t3.micro"
  environment_name                = var.env
  allocated_storage       = 20
  storage_type            = "gp2"
  db_name                 = "${var.env}_hello_world_db"
  db_engine               = "mysql"
  db_engine_version       = "8.0.35"
  db_username             = "${var.env}_admin"
  db_password             = data.aws_secretsmanager_secret_version.db_password.secret_string
}
