resource "azurerm_private_dns_zone" "dns-zone" {
  name = var.private_dns_zone.name
  resource_group_name = try(var.resource_groups[var.private_dns_zone.resource_group_name].name, var.resource_groups.DNS.name)

  dynamic "soa_record" {
    for_each = try(var.private_dns_zone.soa_record, {}) != {} ? [1] : []
    content {
      email = try(var.private_dns_zone.soa_record, "azurecloudoperations.operationsinfonuagiquesazure@ssc-spc.gc.ca")
      expire_time = try(var.private_dns_zone.soa_record_record.expire_time, 2419200)
      minimum_ttl = try(var.private_dns_zone.soa_record_record.minimum_ttl, 10)
      refresh_time = try(var.private_dns_zone.soa_record_record.refresh_time, 3600)
      retry_time = try(var.private_dns_zone.soa_record_record.retry_time, 300)
      ttl = try(var.private_dns_zone.soa_record_record.ttl, 3600)
      tags = var.tags
    }  
  }

  tags = var.tags

  lifecycle {
    ignore_changes = [ tags, ]
  }
}

resource "azurerm_private_dns_zone_virtual_network_link" "dns-zone-link" {
  name = "${var.private_dns_zone.name}-vlnk"
  private_dns_zone_name = azurerm_private_dns_zone.dns-zone.name
  resource_group_name = azurerm_private_dns_zone.dns-zone.resource_group_name
  virtual_network_id = try(var.private_dns_zone.vnetID, replace(var.subnets.MAZ.id, "/\\/subnets.*$/", ""))
  registration_enabled = try(var.private_dns_zone.registration_enabled, false)
  tags = var.tags

  lifecycle {
    ignore_changes = [ tags, ]
  }
}