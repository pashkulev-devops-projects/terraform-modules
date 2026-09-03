output "public_ips" {
  value       = var.create_public_ip ? google_compute_instance.this[*].network_interface[0].access_config[0].nat_ip : []
  description = "List of public IPv4 addresses assigned to the instances"
}
