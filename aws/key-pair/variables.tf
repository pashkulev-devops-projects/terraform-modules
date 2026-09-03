variable "name" {
  type        = string
  description = "Name of the AWS key pair."
}

variable "public_key" {
  type        = string
  description = "Public SSH key registered with AWS."
}