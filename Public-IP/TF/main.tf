variable "resource_group_name" {
  description = "resource group name"
  type        = string
}
data "azurerm_resource_group" "rg" {
  name = var.resource_group_name
}
locals {
  pipName = "pip-test-01"
}

resource "azurerm_public_ip" "pip" {
  name                    = local.pipName
  resource_group_name     = var.resource_group_name
  location                = data.azurerm_resource_group.rg.location
  allocation_method       = "Dynamic"
  ip_version              = "IPv4"
  idle_timeout_in_minutes = 4
}
