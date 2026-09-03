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

variable "nsg_rules" {
  description = "List of NSG security rules"
  type = list(object({
    name                         = string
    priority                     = number
    direction                    = string
    access                       = string
    protocol                     = string
    description                  = optional(string)
    source_port_ranges           = optional(list(string), ["0-65535"])
    destination_port_ranges      = list(string)
    source_address_prefixes      = list(string)
    destination_address_prefixes = optional(list(string), ["0.0.0.0/0"])
  }))
  default = []

  validation {
    condition = alltrue([
      for rule in var.nsg_rules :
      rule.priority >= 100 && rule.priority <= 4096
    ])
    error_message = "Each NSG rule priority must be between 100 and 4096."
  }

  validation {
    condition = (
      length(distinct([for rule in var.nsg_rules : rule.priority])) ==
      length(var.nsg_rules)
    )
    error_message = "Each NSG rule priority must be unique."
  }
}

variable "tags" {
  type        = map(string)
  description = "Resource tags for tracking and cost management"
  default     = {}
}