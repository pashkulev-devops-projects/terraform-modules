variable "server_base_name" {
  type        = string
  description = "Base name used for Hetzner Cloud servers."

  validation {
    condition     = length(trimspace(var.server_base_name)) > 0
    error_message = "server_base_name must not be empty."
  }
}

variable "server_count" {
  type        = number
  description = "Number of Hetzner Cloud servers to create."
  default     = 1

  validation {
    condition     = var.server_count >= 1 && floor(var.server_count) == var.server_count
    error_message = "server_count must be a whole number greater than or equal to 1."
  }
}

variable "firewall_ids" {
  type        = set(number)
  description = "IDs of Hetzner Cloud firewalls attached before the servers first boot."
  default     = []
}

variable "server_type" {
  type        = string
  description = "Hetzner Cloud server type."
  default     = "cx23"
}

variable "location" {
  type        = string
  description = "Hetzner Cloud location."
  default     = "nbg1"
}

variable "image" {
  type        = string
  description = "Operating-system image used by the server."
  default     = "ubuntu-24.04"
}

variable "ssh_keys" {
  type        = set(string)
  description = "IDs or names of SSH keys installed when the server is created."

  validation {
    condition     = length(var.ssh_keys) > 0
    error_message = "ssh_keys must contain at least one SSH key ID or name."
  }
}

variable "enable_ipv6" {
  type        = bool
  description = "Whether to enable public IPv6 connectivity."
  default     = true
}

variable "backups" {
  type        = bool
  description = "Whether to enable Hetzner automatic backups."
  default     = false
}

variable "labels" {
  type        = map(string)
  description = "Labels applied to the server and Primary IPv4."
  default     = {}
}
