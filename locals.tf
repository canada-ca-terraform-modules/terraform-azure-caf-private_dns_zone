locals {
  resource_group_name = try(strcontains(var.private_dns_zone.resource_group, "/resourceGroups/") ? regex("[^\\/]+$", var.private_dns_zone.resource_group) :  var.resource_groups[var.private_dns_zone.resource_group].name, "")
}