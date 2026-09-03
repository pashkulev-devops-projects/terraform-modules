# Optional Public IPs
resource "azurerm_public_ip" "this" {
  count = var.create_public_ip ? var.vm_count : 0

  name                = "pip-${var.project_name}-${var.environment}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name
  allocation_method   = "Static"
  sku                 = "Standard"

  tags = var.tags
}

resource "azurerm_network_interface" "this" {
  count = var.vm_count

  name                = "nic-${var.project_name}-${var.environment}-${count.index + 1}"
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = var.ip_config_name
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = var.private_ip_allocation_method

    # Conditional lookup logic for static configurations
    private_ip_address = var.private_ip_allocation_method == "Static" && var.private_ip_addresses != null ? var.private_ip_addresses[count.index] : null

    public_ip_address_id = var.create_public_ip ? azurerm_public_ip.this[count.index].id : null
  }

  tags = var.tags

  lifecycle {
    precondition {
      condition = (
        var.private_ip_allocation_method != "Static" ||
        (
          var.private_ip_addresses != null &&
          length(var.private_ip_addresses) == var.vm_count
        )
      )
      error_message = "When private_ip_allocation_method is Static, private_ip_addresses must contain exactly one address per VM."
    }
  }
}

resource "azurerm_linux_virtual_machine" "this" {
  count = var.vm_count

  name                = "vm-${var.project_name}-${var.environment}-${count.index + 1}"
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = var.admin_username

  disable_password_authentication = var.disable_password_authentication
  admin_password = (
    var.disable_password_authentication
    ? null
    : var.admin_password
  )

  # --- Spot architecture configurations ---
  priority        = var.vm_priority
  eviction_policy = var.vm_priority == "Spot" ? var.vm_eviction_policy : null
  max_bid_price   = var.vm_priority == "Spot" ? var.vm_max_bid_price : null

  network_interface_ids = [
    azurerm_network_interface.this[count.index].id
  ]

  admin_ssh_key {
    username   = var.admin_username
    public_key = var.ssh_public_key
  }

  os_disk {
    caching              = var.os_disk.caching
    storage_account_type = var.os_disk.storage_account_type
    disk_size_gb         = var.os_disk.disk_size_gb
  }

  source_image_reference {
    publisher = var.source_image_reference.publisher
    offer     = var.source_image_reference.offer
    sku       = var.source_image_reference.sku
    version   = var.source_image_reference.version
  }

  dynamic "boot_diagnostics" {
    for_each = var.enable_boot_diagnostics ? [1] : []

    content {}
  }

  lifecycle {
    precondition {
      condition     = var.disable_password_authentication ? true : var.admin_password != null
      error_message = "admin_password must be provided when password authentication is enabled."
    }
  }

  tags = var.tags
}
