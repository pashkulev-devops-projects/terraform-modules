variable "name" {
  description = "Name of the VPC network."
  type        = string
}

variable "routing_mode" {
  description = "Dynamic routing mode for the VPC network."
  type        = string
  default     = "REGIONAL"

  validation {
    condition     = contains(["REGIONAL", "GLOBAL"], var.routing_mode)
    error_message = "routing_mode must be either REGIONAL or GLOBAL."
  }
}

variable "subnets" {
  description = "Subnets to create in the VPC network."

  type = map(object({
    name                     = string
    cidr_range               = string
    region                   = string
    private_ip_google_access = optional(bool, false)
  }))
}