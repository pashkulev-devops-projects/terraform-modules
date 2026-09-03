output "record_ids" {
  value = {
    for key, record in cloudflare_dns_record.this : key => record.id
  }
  description = "DNS record IDs keyed by input map key."
}

output "record_names" {
  value = {
    for key, record in cloudflare_dns_record.this : key => record.name
  }
  description = "DNS record names keyed by input map key."
}
