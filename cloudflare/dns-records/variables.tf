variable "zone_id" {
  type        = string
  description = "Cloudflare zone ID containing the DNS records."
}

variable "records" {
  description = "DNS records to create."

  type = map(object({
    name    = string
    type    = string
    content = string
    ttl     = optional(number, 1)
    proxied = optional(bool, false)
    comment = optional(string)
  }))
}
