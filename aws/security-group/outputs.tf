output "security_group_id" {
  value       = aws_security_group.this.id
  description = "The generated ID of the custom security group"
}
