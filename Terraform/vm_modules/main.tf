terraform {
  backend          "azurerm"        {}
}

module "resource-groupe" {
  source         = "./modules/rg"
  location       = "${var.location}"
  resource_group = "${var.resource_group}"
}

module "network" {
  source         = "./modules/network"
  location       = "${var.location}"
  project_name   = "${var.project_name}"
  resource_group = "${module.resource-groupe.rg_name}"
}

module "vm" {
  source         = "./modules/vm"
  location       = "${var.location}"
  project_name   = "${var.project_name}"
  admin_username = "${var.admin_username}"
  admin_password = "${var.admin_password}"
  resource_group = "${module.resource-groupe.rg_name}"
  subnet_id      = "${module.network.subnet_id}"
}
