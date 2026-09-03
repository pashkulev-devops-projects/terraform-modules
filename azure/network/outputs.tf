output "vnet_id" {
  value       = azurerm_virtual_network.this.id
  description = "ID of the virtual network."
}

output "vnet_name" {
  value       = azurerm_virtual_network.this.name
  description = "Name of the virtual network."
}

output "subnet_ids" {
  description = "Map of subnet key → subnet ID"
  value = {
    for subnet_key, subnet in azurerm_subnet.this :
    subnet_key => subnet.id
  }
}

output "subnet_names" {
  description = "Map of subnet key → subnet name"
  value = {
    for subnet_key, subnet in azurerm_subnet.this :
    subnet_key => subnet.name
  }
}