variable "resource_groups" {
  description = "(Required) Objects containing all resource groups for the sub"
  type = any
}

variable "subnets" {
  description = "(Required) Object containing subnet information"
  type = any
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
