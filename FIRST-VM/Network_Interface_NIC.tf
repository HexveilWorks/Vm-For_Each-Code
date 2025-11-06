resource "azurerm_network_interface" "terra-nic" {


depends_on = [ azurerm_subnet.terra-subnet ]
  for_each = var.nic-core
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name =each.value.rg_name

  ip_configuration {
    name                          = "frontend-ip"
    subnet_id                     =  azurerm_subnet.terra-subnet[each.value.sub_name].id 
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          =  azurerm_public_ip.terra-public_ip[each.value.pip_name].id  
  }
}
