variable "vpc_id" {
  description = "VPC ID where the ECS service will be deployed"
  type        = string
}

variable "environment_name" {
  description = "VPC ID where the ECS service will be deployed"
  type        = string
}


variable "aws_region" {
  description = "AWS region where the ECS service will be deployed"
  type        = string
}

variable "db_secrets_arn" {
  description = "Secret arn in Secret Manager"
  type        = string
}

variable "db_username" {
  description = "DB Username"
  type        = string
}

variable "rds_endpoint" {
  description = "RDB Endpoint"
  type        = string
}


variable "private_subnet_ids" {
  description = "List of private subnet IDs for the ECS tasks"
  type        = list(string)
}

variable "container_name" {
  description = "Name of the container to run in the ECS service"
  type        = string
}

variable "container_image" {
  description = "Docker image to use for the container"
  type        = string
}

variable "container_port" {
  description = "The port on which the container will listen"
  type        = number
}

variable "task_cpu" {
  description = "The amount of CPU to allocate for the task"
  type        = number
}

variable "task_memory" {
  description = "The amount of memory to allocate for the task"
  type        = number
}

variable "desired_count" {
  description = "The desired number of instances of the task to run"
  type        = number
  default     = 1
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(string)
  default     = {}
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_listener_port" {
  description = "The port on which the ALB will listen"
  type        = number
  default     = 80
}

variable "health_check_path" {
  description = "Path for the ALB health check"
  type        = string
  default     = "/"
}

variable "alb_security_group_ids" {
  description = "List of security group IDs to attach to the ECS tasks"
  type        = list(string)
}


variable "security_group_ids" {
  description = "List of security group IDs to attach to the ECS tasks"
  type        = list(string)
}
