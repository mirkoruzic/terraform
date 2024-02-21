output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "alb_security_group_ids" {
  description = "The ID of the ALB security group"
  value       = module.alb_security_group.security_group_id
}

output "ecs_security_group" {
  description = "The ID of the ECS security group"
  value       = module.ecs_security_group.security_group_id
}

output "rds_aurora_security_group" {
  description = "The ID of the RDS Aurora security group"
  value       = module.rds_aurora_security_group.security_group_id
}

output "https_security_group" {
  description = "The ID of the HTTPS security group"
  value       = module.https_security_group.security_group_id
}

output "db_subnet_group_name" {
  value = module.vpc.db_subnet_group_name
}