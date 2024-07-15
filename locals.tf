locals {
  resource_group_name = try(strcontains(var.private_dns_zone.resource_group, "/resourceGroups/") ? regex("[^\\/]+$", var.private_dns_zone.resource_group) :  var.resource_groups[var.private_dns_zone.resource_group].name, "")
  vnet_id = try(strcontains(var.private_dns_zone.vnet_link, "/resourceGroups/") ?  var.private_dns_zone.vnet_link : var.vnet_id, var.vnet_id)
}