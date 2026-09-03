resource "hcloud_primary_ip" "ipv4" {
  count = var.server_count

  name        = "${var.server_base_name}-${count.index + 1}-ipv4"
  location    = var.location
  type        = "ipv4"
  auto_delete = false
  labels      = var.labels
}

resource "hcloud_server" "this" {
  count = var.server_count

  name         = "${var.server_base_name}-${count.index + 1}"
  server_type  = var.server_type
  location     = var.location
  image        = var.image
  ssh_keys     = var.ssh_keys
  firewall_ids = var.firewall_ids
  backups      = var.backups
  labels       = var.labels

  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.ipv4[count.index].id
    ipv6_enabled = var.enable_ipv6
  }
}
