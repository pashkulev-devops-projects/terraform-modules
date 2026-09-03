variable "name" {
  type        = string
  description = "Name of the firewall rule."
}

variable "target_tags" {
  type        = set(string)
  description = "Network tags of instances to which this rule applies."
}

variable "network_id" {
  type        = string
  description = "ID of the VPC network to attach the VM to"
}

variable "allow_protocol_ports" {
  type = object({
    protocol = string
    ports    = list(string)
  })
  description = "Allowed protocol and ports for the firewall rule"
}

variable "source_ranges" {
  type        = list(string)
  description = "List of source IP ranges allowed to access the VM"

  validation {
    condition     = length(var.source_ranges) > 0
    error_message = "source_ranges must contain at least one CIDR range."
  }
}