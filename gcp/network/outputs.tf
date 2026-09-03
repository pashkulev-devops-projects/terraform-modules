output "network_id" {
  description = "ID of the VPC network."
  value       = google_compute_network.this.id
}

output "network_name" {
  description = "Name of the VPC network."
  value       = google_compute_network.this.name
}

output "subnet_ids" {
  description = "Map of subnet IDs keyed by subnet map key."
  value = {
    for key, subnet in google_compute_subnetwork.this : key => subnet.id
  }
}

