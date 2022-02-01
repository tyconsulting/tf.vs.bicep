variable "storage_account_name" {
  description = "storage account name"
  type        = string
}

variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

variable "tags" {
  description = "storage account tags"
  type        = object({})
}

data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}

resource "azurerm_storage_account" "sa" {
  name                     = var.storage_account_name
  resource_group_name      = var.resource_group_name
  location                 = data.azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = var.tags
}

output "name" {
  description = "Storage Account name"
  value       = azurerm_storage_account.sa.name
}
