resource "azurerm_linux_virtual_machine" "terra-vm" {

depends_on = [ azurerm_network_interface.terra-nic ]
for_each = var.vm-core

  name                = each.value.vm_name
  resource_group_name = each.value.rg_name
  location            = each.value.location
  size                = each.value.size
  admin_username      = each.value.admin_username
  admin_password      = each.value.admin_password

  network_interface_ids = [
    azurerm_network_interface.terra-nic[each.value.nic_name].id,
  ]

  disable_password_authentication = false

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  provisioner "remote-exec" {
    inline = [ 
      "sudo apt-get update -y",
      "sudo apt-get install -y nginx"
     ]
    connection {
      type     = "ssh"
      user     = "Rhea_VM"
      password = "rhea@unstoppable25"
      host     = self.public_ip_address
    }

  }
  
}
