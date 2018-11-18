provider "azurerm" {
}


resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group}"
  location = "${var.location}"

  tags {
    environment = "Terraform HOL bootcamp"
  }
}

  module "network" {
    source              = "Azure/network/azurerm"
    location            = "${var.location}"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    address_space       = "10.0.0.0/16"
    subnet_prefixes     = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
    subnet_names        = ["subnet1", "subnet2", "subnet3"]
  }

  module "linuxservers" {
    source              = "Azure/compute/azurerm"
    resource_group_name = "${azurerm_resource_group.rg.name}"
    location            = "${var.location}"
    vm_os_simple        = "UbuntuServer"
    public_ip_dns       = ["linsimplevmips"] // change to a unique name per datacenter region
    vnet_subnet_id      = "${module.network.vnet_subnets[0]}"
    ssh_key = "/mnt/d/Carrefour/OneCarrefour/.ssh/vpod1rebond_rsa.pub"
  }