variable "name" {
  type        = string
  description = "Name of the App Configuration store"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the existing resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku" {
  type        = string
  description = "App Configuration SKU"
  default     = "free"
}

variable "public_network_access" {
  type        = string
  description = "Public network access mode"
  default     = "Enabled"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Whether purge protection is enabled for a Standard store"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Soft-delete retention period for a Standard store"
  default     = 7
}

variable "role_assignments" {
  description = "Store-scoped RBAC assignments keyed by a stable caller-defined name"
  type = map(object({
    principal_id         = string
    role_definition_name = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the App Configuration store"
  default     = {}
}
