variable "privateDNSzone" {
  type = any
  default = {}
}

module "private_dns_zone" {
  source = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-private_dns_zone.git"
  for_each = var.privateDNSzone

  private_dns_zone = each.value
  name = each.key
  resource_groups = local.resource_groups_all
  vnet_id = local.Project-vnet.id
  tags = var.tags
}