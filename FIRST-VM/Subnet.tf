resource "azurerm_subnet" "terra-subnet" {

  depends_on           = [azurerm_virtual_network.terra-net]
  for_each             = var.subnet-core
  name                 = each.value.sub_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.vnet_name
  address_prefixes     = each.value.address_prefixes

}
