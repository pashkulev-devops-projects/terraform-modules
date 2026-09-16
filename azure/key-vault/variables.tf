variable "name" {
  type        = string
  description = "Name of the Key Vault"
}

variable "resource_group_name" {
  type        = string
  description = "Name of the existing resource group"
}

variable "location" {
  type        = string
  description = "Azure region"
}

variable "sku_name" {
  type        = string
  description = "Key Vault SKU"
  default     = "standard"
}

variable "purge_protection_enabled" {
  type        = bool
  description = "Whether purge protection is enabled"
  default     = false
}

variable "soft_delete_retention_days" {
  type        = number
  description = "Number of days that soft-deleted data is retained"
  default     = 7
}

variable "public_network_access_enabled" {
  type        = bool
  description = "Whether the public Key Vault endpoint is enabled"
  default     = true
}

variable "role_assignments" {
  description = "Vault-scoped RBAC assignments keyed by a stable caller-defined name"
  type = map(object({
    principal_id         = string
    role_definition_name = string
  }))
}

variable "tags" {
  type        = map(string)
  description = "Tags applied to the Key Vault"
  default     = {}
}
