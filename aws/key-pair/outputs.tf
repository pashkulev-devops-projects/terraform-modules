output "name" {
  value       = aws_key_pair.this.key_name
  description = "Name of the AWS key pair."
}