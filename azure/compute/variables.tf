variable "resource_group_name" {
  type        = string
  description = "Name of the resource group"
}

variable "location" {
  type        = string
  description = "Location of the resource group"
}

variable "vm_count" {
  type        = number
  description = "Number of VMs to create"
  default     = 1

  validation {
    condition     = var.vm_count >= 1
    error_message = "vm_count must be at least 1."
  }
}

variable "project_name" {
  type        = string
  description = "Name of the project"
}

variable "environment" {
  type        = string
  description = "Environment name"
}

variable "vm_size" {
  type        = string
  description = "Size of the VM"
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet"
}

variable "ssh_public_key" {
  type        = string
  description = "Public key for SSH access"
}

variable "admin_username" {
  type        = string
  description = "Admin username for the VM"
}

variable "admin_password" {
  type        = string
  description = "Administrator password when password authentication is enabled."
  default     = null
  sensitive   = true
}

variable "disable_password_authentication" {
  description = "Whether to disable password authentication for SSH"
  type        = bool
  default     = true
}

variable "enable_boot_diagnostics" {
  type        = bool
  description = "Whether to enable Azure managed boot diagnostics."
  default     = true
}

variable "tags" {
  description = "Tags to apply to all resources"
  type        = map(string)
  default     = {}
}

# --- Public IP Variables ---
variable "create_public_ip" {
  description = "Whether to create and associate a Public IP with each VM"
  type        = bool
  default     = false
}

# --- Network Interface Configuration Variables ---
variable "ip_config_name" {
  description = "The name mapping for the NIC internal IP configuration block."
  type        = string
  default     = "internal-ip-config"
}

variable "private_ip_allocation_method" {
  description = "Defines how the private IP address is assigned. Possible values are Dynamic or Static."
  type        = string
  default     = "Dynamic"

  validation {
    condition = contains(["Dynamic", "Static"],
    var.private_ip_allocation_method)
    error_message = "private_ip_allocation_method must be Dynamic or Static."
  }
}

variable "private_ip_addresses" {
  description = "Optional list of static private IPs to assign if private_ip_allocation_method is set to Static. Length must match vm_count."
  type        = list(string)
  default     = null
}

# --- Cost Control Spot Variables ---
variable "vm_priority" {
  description = "Specifies the priority of the virtual machine. Possible values are Regular and Spot."
  type        = string
  default     = "Regular"

  validation {
    condition     = contains(["Regular", "Spot"], var.vm_priority)
    error_message = "vm_priority must be either Regular or Spot."
  }
}

variable "vm_eviction_policy" {
  description = "Specifies the eviction policy for the Spot Virtual Machine. Possible values are Deallocate and Delete."
  type        = string
  default     = "Deallocate" # Retains disks so your Ansible setup steps aren't permanently wiped
}

variable "vm_max_bid_price" {
  description = "The maximum price you are willing to pay for this VM in USD. -1 means standard on-demand price."
  type        = number
  default     = -1
}

# --- OS and Disk Configuration Variables ---
variable "source_image_reference" {
  description = "Source image reference for the VM."
  type = object({
    publisher = string
    offer     = string
    sku       = string
    version   = optional(string, "latest")
  })
}

variable "os_disk" {
  description = "OS disk configuration"
  type = object({
    caching              = optional(string, "ReadWrite")
    storage_account_type = optional(string, "Standard_LRS")
    disk_size_gb         = optional(number) # null = use image default
  })
  default = {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    disk_size_gb         = null
  }
}
