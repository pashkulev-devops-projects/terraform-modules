resource "google_compute_firewall" "this" {
  name    = "${var.name}-firewall"
  network = var.network_id

  allow {
    protocol = var.allow_protocol_ports.protocol
    ports    = var.allow_protocol_ports.ports
  }

  source_ranges = var.source_ranges
  target_tags   = var.target_tags
}