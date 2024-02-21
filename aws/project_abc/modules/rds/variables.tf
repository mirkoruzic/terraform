variable "db_subnet_group_name" {}
variable "vpc_security_group_ids" {}
variable "db_instance_class" {}
variable "db_name" {}
variable "db_username" {}
variable "db_password" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "allocated_storage" {}
variable "storage_type" {}
variable "environment_name" {
  description = "VPC ID where the ECS service will be deployed"
  type        = string
}