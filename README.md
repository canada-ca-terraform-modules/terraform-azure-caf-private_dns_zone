## Requirements

No requirements.

## Providers

| Name                                                          |
| ------------------------------------------------------------- |
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) |

## Modules

No modules.

## Resources

| Name                                                                                                                                                                                 | Type     |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- |
| [azurerm_private_dns_zone.dns-zone](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone)                                                | resource |
| [azurerm_private_dns_zone_virtual_network_link.dns-zone-link](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link) | resource |

## Inputs

| Name                                                                                   | Description                                                             | Type          | Default | Required |
| -------------------------------------------------------------------------------------- | ----------------------------------------------------------------------- | ------------- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name)                                         | (Required) Name of the private DNS zone                                 | `string`      | n/a     |   yes    |
| <a name="input_private_dns_zone"></a> [private\_dns\_zone](#input\_private\_dns\_zone) | (Required) Object describing the private DNS zone and the DNS zone link | `any`         | `{}`    |    no    |
| <a name="input_resource_groups"></a> [resource\_groups](#input\_resource\_groups)      | (Required) Objects containing all resource groups for the sub           | `any`         | `{}`    |    no    |
| <a name="input_tags"></a> [tags](#input\_tags)                                         | Tags for the Private DNS Zone                                           | `map(string)` | `{}`    |    no    |
| <a name="input_vnet_id"></a> [vnet\_id](#input\_vnet\_id)                              | (Required) Vnet ID to link to DNS zone to                               | `string`      | n/a     |   yes    |

## Outputs

| Name                                                                                                                       | Description                   |
| -------------------------------------------------------------------------------------------------------------------------- | ----------------------------- |
| <a name="output_private_dns_zone"></a> [private\_dns\_zone](#output\_private\_dns\_zone)                                   | Private DNS Zone object       |
| <a name="output_private_dns_zone_id"></a> [private\_dns\_zone\_id](#output\_private\_dns\_zone\_id)                        | ID of Private DNS Zone        |
| <a name="output_private_dns_zone_link"></a> [private\_dns\_zone\_link](#output\_private\_dns\_zone\_link)                  | Private DNS Zone link object  |
| <a name="output_private_dns_zone_link_id"></a> [private\_dns\_zone\_link\_id](#output\_private\_dns\_zone\_link\_id)       | ID of Private DNS Zone link   |
| <a name="output_private_dns_zone_link_name"></a> [private\_dns\_zone\_link\_name](#output\_private\_dns\_zone\_link\_name) | Name of Private DNS Zone link |
| <a name="output_private_dns_zone_name"></a> [private\_dns\_zone\_name](#output\_private\_dns\_zone\_name)                  | Name of Private DNS Zone      |

## TFVars Parameters

For more information about private dns zone parameters, refer to the terraform docs: https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone and https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/private_dns_zone_virtual_network_link

| Name                                                                               | Possible values                                  | Default      | Required |
| ---------------------------------------------------------------------------------- | ------------------------------------------------ | ------------ | -------- |
| <a name="resource_group"></a> [resource_group](#resource\_group)                   | Name or ID of the resource group of the DNS zone | DNS-rg       | no       |
| <a name="vnet_link"></a> [vnet_link](#vnet\_link)                                  | ID of a VNET to link the DNS zone                | Project-vnet | no       |
| <a name="soa_record"></a> [soa_record](#soa\_record)                               | Block resource. SOA record for the DNS zone      | null         | no       |
| <a name="registration_enabled"></a> [registration_enabled](#registration\_enabled) | true, false                                      | false        | no       |
| <a name="core_link_enabled"></a> [core_link_enabled](#core\_link\_enabled)         | true,false                                       | false        | no       |