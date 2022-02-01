variable "nsg" {
  description = "The Network Security Group that the rules should be created in."
  type = object({
    name                = string
    resource_group_name = string
  })
}

locals {
  local_subnet = "10.101.1.0/24"
}

resource "azurerm_network_security_rule" "inbound_rule_http" {
  name                        = "HTTP-Allow-In"
  access                      = "Allow"
  direction                   = "Inbound"
  priority                    = 210
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "10.0.0.0/8"
  destination_port_ranges     = ["443", "80"]
  destination_address_prefix  = local.local_subnet
  resource_group_name         = var.nsg.resource_group_name
  network_security_group_name = var.nsg.name
}

resource "azurerm_network_security_rule" "inbound_rule_mssql" {
  name                        = "MSSQL-Allow-In"
  access                      = "Allow"
  direction                   = "Inbound"
  priority                    = 210
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefix       = "10.0.0.0/8"
  destination_port_ranges     = ["1433", "1434", "59999"]
  destination_address_prefix  = local.local_subnet
  resource_group_name         = var.nsg.resource_group_name
  network_security_group_name = var.nsg.name
}
