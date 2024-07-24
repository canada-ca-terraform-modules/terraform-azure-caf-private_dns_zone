variable "privateDNSzone" {
  type = any
  default = {}
}

locals {
  private_dns_zone_ids = {
    for name, param in try(var.privateDNSzone, {}) :
    name => module.private_dns_zone[name].private_dns_zone_id
  }
}

module "private_dns_zone" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git?ref=v1.0.1"
  for_each = var.privateDNSzone

  private_dns_zone = each.value
  name = each.key
  resource_groups = local.resource_groups_all
  vnet_id = local.Project-vnet.id
  tags = var.tags
}