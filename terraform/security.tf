resource "azurerm_network_security_group" "mySecGroup" {
  location            = azurerm_resource_group.rg.location
  name                = "sshtraffic"
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    access    = "Allow"
    direction = "Inbound"
    name      = "ssh"
    priority  = 1001
    protocol  = "Tcp"
    source_port_range = "*"
    destination_port_range = "22"
    source_address_prefix = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociation" {
  network_interface_id      = azurerm_network_interface.nic.id
  network_security_group_id = azurerm_network_security_group.mySecGroup.id
}

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociationW" {
  network_interface_id      = azurerm_network_interface.nicW.id
  network_security_group_id = azurerm_network_security_group.mySecGroup.id
}

resource "azurerm_network_interface_security_group_association" "mySecGroupAssociationN" {
  network_interface_id      = azurerm_network_interface.nicN.id
  network_security_group_id = azurerm_network_security_group.mySecGroup.id
}