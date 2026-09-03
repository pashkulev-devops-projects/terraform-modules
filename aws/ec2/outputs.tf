output "vm_public_ips" {
  value       = aws_instance.this[*].public_ip
  description = "The public IP addresses of VMs"
}
