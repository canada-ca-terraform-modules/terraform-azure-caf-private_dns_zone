variable "name" {
  description = "(Required) Name of the private DNS zone"
  type = string
}

variable "resource_groups" {
  description = "(Required) Objects containing all resource groups for the sub"
  type = any
  default = {}
}

variable "vnet_id" {
  description = "(Required) Vnet ID to link to DNS zone to"
  type = string
}

variable "tags" {
  description = "Tags for the Private DNS Zone"
  type = map(string)
  default = {}
}

variable "private_dns_zone" {
  description = "(Required) Object describing the private DNS zone and the DNS zone link"
  type = any
  default = {}
}
