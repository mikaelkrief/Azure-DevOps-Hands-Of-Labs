resource "azurerm_virtual_network" "vnet" {
  name                = "${var.project_name}vnet"
  location            = "${var.location}"
  address_space       = ["10.0.0.0/16"]
  resource_group_name = "${var.resource_group}"

  tags {
    environment = "Terraform HOL bootcamp"
  }

  //depends_on = ["module.resource-groupe.azurerm_resource_group.rg"]
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.project_name}subnet"
  virtual_network_name = "${azurerm_virtual_network.vnet.name}"
  resource_group_name  = "${var.resource_group}"
  address_prefix       = "10.0.10.0/24"

  //depends_on = ["module.resource-groupe.azurerm_resource_group.rg"]
}
