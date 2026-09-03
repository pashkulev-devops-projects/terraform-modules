output "id" {
  value       = hcloud_ssh_key.this.id
  description = "ID of the Hetzner Cloud SSH key."
}

output "name" {
  value       = hcloud_ssh_key.this.name
  description = "Name of the Hetzner Cloud SSH key."
}

output "fingerprint" {
  value       = hcloud_ssh_key.this.fingerprint
  description = "Fingerprint of the Hetzner Cloud SSH key."
}
