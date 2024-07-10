# variable "name" {
#   description = "(Required) The name of the Private DNS Zone"
#   type = string
# }

# variable "resource_group_name" {
#   description = "(Required) Specifies the resource group where the Private DNS Zone exists"
#   type = string
# }

variable "resource_groups" {
  description = "(Required) Objects containing all resource groups for the sub"
  type = any
}

variable "subnets" {
  description = "(Required) Object containing subnet info"
  type = any
}

# variable "virtual_network_id" {
#   description = "(Required) The ID of the virtual network that should be linked to the DNS Zone"
#   type = string
# }

# variable "soa_record" {
#   description = "Defines a SOA record for the Private DNS Zone"
#   type = any
#   default = {}
# }

# variable "registration_enabled" {
#   description = "Is auto-registration of virtual machine records in the vnet in the Private DNS Zone enabled? Defaults to false"
#   type = bool
#   default = false
# }

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
