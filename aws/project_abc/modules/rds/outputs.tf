
output "db_instance_endpoint" {
  description = "The connection endpoint for the RDS database instance."
  value       = aws_db_instance.default.endpoint
}

output "db_name" {
  description = "The database name."
  value       = var.db_name
}
