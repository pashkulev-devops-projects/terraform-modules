variable "instance_count" {
  type        = number
  description = "Number of VM instances to create"
  default     = 1
}

variable "instance_name" {
  type        = string
  description = "Base name of the VM instances"
}

variable "machine_type" {
  type        = string
  description = "GCP machine sizing"
  default     = "f1-micro"
}

variable "boot_image" {
  type        = string
  description = "The OS image path"
  default     = "ubuntu-os-cloud/ubuntu-2604-lts-amd64"
}

variable "disk_size" {
  type        = number
  description = "The size of the boot disk in GB"
  default     = 10
}

variable "subnetwork_id" {
  description = "ID of the subnet where instances are created."
  type        = string
}

variable "zone" {
  type        = string
  description = "The availability zone to deploy the VM into"
}

variable "ssh_public_key" {
  type        = string
  description = "The raw contents of your local public SSH key"
}

variable "ssh_username" {
  type        = string
  description = "The username that Ansible will use to connect to the VM"
  default     = "vankata"
}

variable "create_public_ip" {
  type        = bool
  description = "Whether to assign an ephemeral public IP address to each instance."
  default     = false
}

variable "network_tags" {
  description = "Network tags to apply to every VM instance."
  type        = set(string)
  default     = []
}