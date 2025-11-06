resource "azurerm_storage_account" "terrastgnama" {

  depends_on               = [azurerm_resource_group.terra-name]
  for_each                 = var.storage-core
  name                     = each.value.stg_name
  resource_group_name      = each.value.resource_group_name
  location                 = each.value.location
  account_tier             = each.value.account_tier
  account_replication_type = each.value.account_replication_type


}
