output "network_security_group_id" {
  value       = azurerm_network_security_group.this.id
  description = "The ID of the network security group to pass to compute instances"
}