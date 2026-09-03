resource "google_compute_instance" "this" {
  count        = var.instance_count
  name         = "${var.instance_name}-${count.index + 1}"
  machine_type = var.machine_type
  zone         = var.zone

  # Tags used by firewall rules to target these instances.
  tags = tolist(var.network_tags)

  boot_disk {
    initialize_params {
      image = var.boot_image
      size  = var.disk_size
    }
  }

  metadata = {
    ssh-keys = "${var.ssh_username}:${var.ssh_public_key}"
  }

  network_interface {
    subnetwork = var.subnetwork_id

    dynamic "access_config" {
      for_each = var.create_public_ip ? [1] : []

      content {}
    }
  }
}
