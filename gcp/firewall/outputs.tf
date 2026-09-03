output "firewall_rule_id" {
  description = "ID of the created firewall rule."
  value       = google_compute_firewall.this.id
}
