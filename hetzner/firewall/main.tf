resource "hcloud_firewall" "this" {
  name   = var.name
  labels = var.labels

  dynamic "rule" {
    for_each = var.rules

    content {
      direction       = rule.value.direction
      protocol        = rule.value.protocol
      port            = contains(["tcp", "udp"], rule.value.protocol) ? rule.value.port : null
      source_ips      = rule.value.direction == "in" ? tolist(rule.value.source_ips) : null
      destination_ips = rule.value.direction == "out" ? tolist(rule.value.destination_ips) : null
      description     = rule.value.description
    }
  }
}
