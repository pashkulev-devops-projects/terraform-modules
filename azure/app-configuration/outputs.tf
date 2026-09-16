output "id" {
  description = "ID of the App Configuration store"
  value       = azurerm_app_configuration.this.id
}

output "name" {
  description = "Name of the App Configuration store"
  value       = azurerm_app_configuration.this.name
}

output "endpoint" {
  description = "Endpoint of the App Configuration store"
  value       = azurerm_app_configuration.this.endpoint
}

output "role_assignment_ids" {
  description = "Role assignment IDs keyed by the caller-provided assignment names"
  value = {
    for name, assignment in azurerm_role_assignment.this :
    name => assignment.id
  }
}
