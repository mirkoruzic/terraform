data "terraform_remote_state" "network" {
  backend = "s3"
  config = {
    bucket = "[SET_S3_BUCKET_FOR_TF_STATE]"  # Replace with your Terraform S3 TFState bucket
    key    = "state/environment/${var.env}/network/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}

data "terraform_remote_state" "secrets" {
  backend = "s3"
  config = {
    bucket = "[SET_S3_BUCKET_FOR_TF_STATE]"  # Replace with your Terraform S3 TFState bucket
    key    = "state/environment/${var.env}/secrets/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}

data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "[SET_S3_BUCKET_FOR_TF_STATE]"  # Replace with your Terraform S3 TFState bucket
    key    = "state/environment/${var.env}/db/terraform.tfstate"
    region = "eu-west-1"
    encrypt = true
  }
}

module "ecs_fargate" {
  source = "../../../modules/ecs"
  environment_name = var.env
  container_name  = "hello-world-webapp"
  container_image = "safdarj/node-web-app"
  container_port  = 8080
  task_cpu        = "256" 
  task_memory     = "512"
  vpc_id             = data.terraform_remote_state.network.outputs.vpc_id 
  public_subnet_ids  = data.terraform_remote_state.network.outputs.public_subnet_ids 
  private_subnet_ids = data.terraform_remote_state.network.outputs.private_subnet_ids  
  alb_security_group_ids = [data.terraform_remote_state.network.outputs.alb_security_group_ids] 
  security_group_ids = [
    data.terraform_remote_state.network.outputs.ecs_security_group,
    data.terraform_remote_state.network.outputs.https_security_group,
    data.terraform_remote_state.network.outputs.rds_aurora_security_group
  ]
  db_username = "${var.env}_admin"
  rds_endpoint = data.terraform_remote_state.db.outputs.db_instance_endpoint
  db_secrets_arn = data.terraform_remote_state.secrets.outputs.db_secret_arn
  alb_listener_port = 80
  health_check_path = "/"
  aws_region = "eu-west-1"
  tags = {
    Environment = var.env
  }
}
