output "vm_ids" {
  description = "IDs of the created VMs"
  value       = azurerm_linux_virtual_machine.this[*].id
}

output "private_ip_addresses" {
  description = "Private IP addresses of the VMs"
  value       = azurerm_network_interface.this[*].private_ip_address
}

output "public_ip_addresses" {
  description = "Public IP addresses of the VMs (empty if create_public_ip = false)"
  value       = var.create_public_ip ? azurerm_public_ip.this[*].ip_address : []
}

output "network_interface_ids" {
  description = "IDs of the network interfaces"
  value       = azurerm_network_interface.this[*].id
}