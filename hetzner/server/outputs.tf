output "server_ids" {
  value       = hcloud_server.this[*].id
  description = "IDs of the Hetzner Cloud servers."
}

output "public_ipv4_addresses" {
  value       = hcloud_primary_ip.ipv4[*].ip_address
  description = "Persistent public IPv4 addresses assigned to the servers."
}

output "public_ipv6_addresses" {
  value       = var.enable_ipv6 ? hcloud_server.this[*].ipv6_address : []
  description = "Public IPv6 addresses assigned to the servers."
}

output "statuses" {
  value       = hcloud_server.this[*].status
  description = "Current statuses of the Hetzner Cloud servers."
}
