resource "azurerm_network_interface_security_group_association" "example" {

depends_on = [ azurerm_resource_group.terra-name]
    for_each = var.nsg_associa-core
  network_interface_id      = azurerm_network_interface.terra-nic[each.value.nic_name].id
  network_security_group_id = azurerm_network_security_group.terra-nsg[each.value.nsg_name].id
}
