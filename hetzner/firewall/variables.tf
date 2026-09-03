variable "name" {
  type        = string
  description = "Name of the Hetzner Cloud firewall."

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "name must not be empty."
  }
}

variable "rules" {
  description = "Inbound and outbound firewall rules."

  type = list(object({
    direction       = string
    protocol        = string
    port            = optional(string)
    source_ips      = optional(set(string), [])
    destination_ips = optional(set(string), [])
    description     = optional(string)
  }))

  default = []

  validation {
    condition = alltrue([
      for rule in var.rules :
      contains(["in", "out"], rule.direction)
    ])
    error_message = "Each rule direction must be either in or out."
  }

  validation {
    condition = alltrue([
      for rule in var.rules :
      contains(["tcp", "udp", "icmp", "gre", "esp"], rule.protocol)
    ])
    error_message = "Each rule protocol must be tcp, udp, icmp, gre, or esp."
  }

  validation {
    condition = alltrue([
      for rule in var.rules :
      !contains(["tcp", "udp"], rule.protocol) || rule.port != null
    ])
    error_message = "TCP and UDP rules must define a port or port range."
  }

  validation {
    condition = alltrue([
      for rule in var.rules :
      (rule.direction == "in" && length(rule.source_ips) > 0) ||
      (rule.direction == "out" && length(rule.destination_ips) > 0)
    ])
    error_message = "Inbound rules require source_ips; outbound rules require destination_ips."
  }
}

variable "labels" {
  type        = map(string)
  description = "Labels applied to the firewall."
  default     = {}
}
