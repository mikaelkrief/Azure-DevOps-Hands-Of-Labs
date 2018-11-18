resource "azurerm_network_interface" "nic" {
  name                = "${var.project_name}nic"
  location            = "${var.location}"
  resource_group_name = "${var.resource_group}"

  ip_configuration {
    name                          = "${var.project_name}ipconfig"
    subnet_id                     = "${var.subnet_id}"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = "${azurerm_public_ip.pip.id}"
  }
}

resource "azurerm_public_ip" "pip" {
  name                         = "${var.project_name}-ip"
  location                     = "${var.location}"
  resource_group_name          = "${var.resource_group}"
  public_ip_address_allocation = "Dynamic"
  domain_name_label            = "holterraform"

  tags {
    environment = "Terraform HOL"
  }
}

resource "azurerm_storage_account" "stor" {
  name                     = "${var.project_name}stor"
  location                 = "${var.location}"
  resource_group_name      = "${var.resource_group}"
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags {
    environment = "Terraform HOL"
  }
}

resource "azurerm_managed_disk" "datadisk" {
  name                 = "${var.project_name}-datadisk"
  location             = "${var.location}"
  resource_group_name  = "${var.resource_group}"
  storage_account_type = "Standard_LRS"
  create_option        = "Empty"
  disk_size_gb         = "1023"

  tags {
    environment = "Terraform HOL"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.project_name}vm"
  location              = "${var.location}"
  resource_group_name   = "${var.resource_group}"
  vm_size               = "Standard_DS1_v2"
  network_interface_ids = ["${azurerm_network_interface.nic.id}"]

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }

  storage_os_disk {
    name              = "${var.project_name}-osdisk"
    managed_disk_type = "Standard_LRS"
    caching           = "ReadWrite"
    create_option     = "FromImage"
  }

  storage_data_disk {
    name              = "${var.project_name}-datadisk"
    managed_disk_id   = "${azurerm_managed_disk.datadisk.id}"
    managed_disk_type = "Standard_LRS"
    disk_size_gb      = "1023"
    create_option     = "Attach"
    lun               = 0
  }

  os_profile {
    computer_name  = "VMHOL"
    admin_username = "${var.admin_username}"
    admin_password = "${var.admin_password}"
  }

  os_profile_linux_config {
    disable_password_authentication = false
  }

  boot_diagnostics {
    enabled     = true
    storage_uri = "${azurerm_storage_account.stor.primary_blob_endpoint}"
  }
}
