variable "storage_account_name" {
  description = "storage account name"
  type        = string
}

variable "blob_container_name" {
  description = "Blob Container name"
  type        = string
}

resource "azurerm_storage_container" "container" {
  name = var.blob_container_name

  storage_account_name = var.storage_account_name

  container_access_type = "private"
}

output "name" {
  description = "Blob Container name"
  value       = azurerm_storage_container.container.name
}
