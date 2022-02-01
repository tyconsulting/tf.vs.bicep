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
  name                        = "SSH-Allow-In"
  access                      = "Allow"
  direction                   = "Inbound"
  priority                    = 230
  protocol                    = "Tcp"
  source_port_range           = "*"
  source_address_prefixes     = ["10.0.0.0/8", "10.1.0.0/16"]
  destination_port_range      = "22"
  destination_address_prefix  = local.local_subnet
  resource_group_name         = var.nsg.resource_group_name
  network_security_group_name = var.nsg.name
}

