variable "name" {
  type        = string
  description = "Name of the Hetzner Cloud SSH key."

  validation {
    condition     = length(trimspace(var.name)) > 0
    error_message = "name must not be empty."
  }
}

variable "public_key" {
  type        = string
  description = "Public SSH key registered with Hetzner Cloud."

  validation {
    condition     = length(trimspace(var.public_key)) > 0
    error_message = "public_key must not be empty."
  }
}

variable "labels" {
  type        = map(string)
  description = "Labels applied to the SSH key."
  default     = {}
}
