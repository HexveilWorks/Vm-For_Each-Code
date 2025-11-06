resource "azurerm_resource_group" "terra-name" {
  for_each = var.rg-core
  name     = each.value.rg_name
  location = each.value.location

}