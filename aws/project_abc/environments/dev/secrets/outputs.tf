output "db_secret_arn" {
  value = module.db_secrets.db_secret_arn
  description = "ARN for database credentials secret"
}
