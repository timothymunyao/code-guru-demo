output "function_url" {
  description = "Function URL."

  value = aws_lambda_function_url.codeguru-test_url.function_url
}
output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.codeguru_test_instance.address
}
output "rds_username" {
  description = "RDS instance hostname"
  value       = aws_db_instance.codeguru_test_instance.username
}
output "rds_password" {
  description = "RDS instance hostname"
  value       = aws_db_instance.codeguru_test_instance.password
  sensitive   = true
}