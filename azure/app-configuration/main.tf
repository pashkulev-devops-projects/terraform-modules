resource "azurerm_app_configuration" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  sku                 = var.sku

  local_auth_enabled    = false
  public_network_access = var.public_network_access

  purge_protection_enabled = (
    var.sku == "standard" ? var.purge_protection_enabled : null
  )
  soft_delete_retention_days = (
    var.sku == "standard" ? var.soft_delete_retention_days : null
  )

  tags = var.tags
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  scope                = azurerm_app_configuration.this.id
  principal_id         = each.value.principal_id
  role_definition_name = each.value.role_definition_name
}
