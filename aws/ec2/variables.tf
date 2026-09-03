variable "instance_count" {
  type        = number
  description = "Number of EC2 instances to create."
  default     = 1
}

variable "ami_id" {
  type        = string
  description = "AMI ID used to create the EC2 instances."
}

variable "instance_type" {
  type        = string
  description = "EC2 instance type."
  default     = "t3.micro"
}

variable "security_group_id" {
  type        = string
  description = "Security group attached to the EC2 instances."
}

variable "ssh_key_name" {
  type        = string
  description = "Name of the AWS key pair used for SSH authentication."
}

variable "server_base_name" {
  type        = string
  description = "Base name used for EC2 instance Name tags."
}

variable "root_volume_size" {
  type        = number
  description = "The size of the root volume in Gigabytes"
  default     = 8
}

variable "root_volume_type" {
  type        = string
  description = "The type of the root EBS volume (e.g., gp3, gp2)"
  default     = "gp3"
}

variable "delete_storage_on_termination" {
  type        = bool
  description = "Whether the data volume should be automatically deleted when the VM is destroyed"
  default     = true
}

variable "subnet_id" {
  type        = string
  description = "ID of the subnet in which to launch the EC2 instances."
}