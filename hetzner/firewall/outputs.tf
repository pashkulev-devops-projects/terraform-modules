output "firewall_id" {
  value       = hcloud_firewall.this.id
  description = "ID of the Hetzner Cloud firewall."
}

output "name" {
  value       = hcloud_firewall.this.name
  description = "Name of the Hetzner Cloud firewall."
}
