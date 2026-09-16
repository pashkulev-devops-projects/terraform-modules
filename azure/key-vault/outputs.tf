output "id" {
  description = "ID of the Key Vault"
  value       = azurerm_key_vault.this.id
}

output "name" {
  description = "Name of the Key Vault"
  value       = azurerm_key_vault.this.name
}

output "vault_uri" {
  description = "URI of the Key Vault"
  value       = azurerm_key_vault.this.vault_uri
}

output "role_assignment_ids" {
  description = "Role assignment IDs keyed by the caller-provided assignment names"
  value = {
    for name, assignment in azurerm_role_assignment.this :
    name => assignment.id
  }
}
