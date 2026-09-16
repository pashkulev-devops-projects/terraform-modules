data "azurerm_client_config" "current" {}

resource "azurerm_key_vault" "this" {
  name                = var.name
  location            = var.location
  resource_group_name = var.resource_group_name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = var.sku_name

  rbac_authorization_enabled    = true
  purge_protection_enabled      = var.purge_protection_enabled
  soft_delete_retention_days    = var.soft_delete_retention_days
  public_network_access_enabled = var.public_network_access_enabled

  network_acls {
    bypass                     = var.network_acls.bypass
    default_action             = var.network_acls.default_action
    ip_rules                   = var.network_acls.ip_rules
    virtual_network_subnet_ids = var.network_acls.virtual_network_subnet_ids
  }

  tags = var.tags
}

resource "azurerm_role_assignment" "this" {
  for_each = var.role_assignments

  scope                = azurerm_key_vault.this.id
  principal_id         = each.value.principal_id
  role_definition_name = each.value.role_definition_name
}
