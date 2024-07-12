resource "azurerm_private_dns_zone" "dns-zone" {
  name = var.name
  resource_group_name = local.resource_group_name == "" ? var.resource_groups.DNS.name : local.resource_group_name

  dynamic "soa_record" {
    for_each = try(var.private_dns_zone.soa_record, {}) != {} ? [1] : []
    content {
      email = try(var.private_dns_zone.soa_record.email, "azurecloudoperations.operationsinfonuagiquesazure_ssc-spc.gc.ca")
      expire_time = try(var.private_dns_zone.soa_record.expire_time, 2419200)
      minimum_ttl = try(var.private_dns_zone.soa_record.minimum_ttl, 10)
      refresh_time = try(var.private_dns_zone.soa_record.refresh_time, 3600)
      retry_time = try(var.private_dns_zone.soa_record.retry_time, 300)
      ttl = try(var.private_dns_zone.soa_record.ttl, 3600)
      tags = var.tags
    }  
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [ tags, ]
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns-zone-link" {
  name = "${var.name}-vlnk"
  private_dns_zone_name = azurerm_private_dns_zone.dns-zone.name
  resource_group_name = azurerm_private_dns_zone.dns-zone.resource_group_name
  virtual_network_id = try(var.private_dns_zone.vnetID, replace(var.subnet_id, "/\\/subnets.*$/", ""))
  registration_enabled = try(var.private_dns_zone.registration_enabled, false)
  tags = var.tags

  lifecycle {
    ignore_changes = [ tags, ]
  }
}