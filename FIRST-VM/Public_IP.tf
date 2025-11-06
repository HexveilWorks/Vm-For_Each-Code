resource "azurerm_public_ip" "terra-public_ip" {

depends_on = [ azurerm_resource_group.terra-name]
    for_each = var.public_ip-core
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  allocation_method   = each.value.allocation_method

}