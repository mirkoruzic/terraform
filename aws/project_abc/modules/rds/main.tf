resource "aws_db_instance" "default" {
  identifier        = "${var.environment_name}-db-instance"
  instance_class    = var.db_instance_class
  engine            = var.db_engine
  engine_version    = var.db_engine_version
  allocated_storage = var.allocated_storage
  storage_type      = var.storage_type

  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = var.vpc_security_group_ids
  username = var.db_username
  password = var.db_password
  db_name  = var.db_name

  skip_final_snapshot = true

  tags = {
    Name        = "${var.environment_name}-rds"
    Environment = "${var.environment_name}-rds"
  }
}