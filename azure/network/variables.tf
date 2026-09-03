variable "resource_group_name" {
  type        = string
  description = "Name of the existing resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Deployment environment"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "Address space for the VNet"
}

variable "subnets" {
  type = map(object({
    name                              = string
    address_prefixes                  = list(string)
    service_endpoints                 = optional(list(string), [])
    private_endpoint_network_policies = optional(string, "Disabled")
    default_outbound_access_enabled   = optional(bool, true)

    delegation = optional(object({
      name = string
      service_delegation = object({
        name    = string
        actions = optional(list(string), [])
      })
    }), null)

  }))
  description = "Configuration map for subnets inside the VNet."
  default     = {}

  validation {
    condition = alltrue([
      for subnet in var.subnets : length(subnet.address_prefixes) > 0
    ])
    error_message = "Each subnet must have at least one address prefix."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource tags for tracking and cost management"
  default     = {}
}