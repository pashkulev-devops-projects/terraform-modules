resource "google_compute_network" "this" {
  name                    = var.name
  auto_create_subnetworks = false
  routing_mode            = var.routing_mode
}

resource "google_compute_subnetwork" "this" {
  for_each = var.subnets

  name                     = each.value.name
  ip_cidr_range            = each.value.cidr_range
  region                   = each.value.region
  network                  = google_compute_network.this.id
  private_ip_google_access = each.value.private_ip_google_access
}
