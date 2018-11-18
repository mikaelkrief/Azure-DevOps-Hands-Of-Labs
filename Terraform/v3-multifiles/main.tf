resource "azurerm_resource_group" "rg" {
  name     = "${var.resource_group_name}"
  location = "${var.location}"

  tags {
    environment = "Terraform meetup"
  }
}


resource "azurerm_storage_account" "sa" {
  name                     = "storagevhdmeetup"
  resource_group_name      = "${azurerm_resource_group.rg.name}"
  location                 = "${var.location}"
  account_replication_type = "LRS"
  account_tier             = "Standard"
  enable_blob_encryption   = "true"
  enable_file_encryption   = "true"
}

resource "azurerm_storage_container" "container" {
  name                  = "vhds"
  resource_group_name   = "${azurerm_resource_group.rg.name}"
  storage_account_name  = "${azurerm_storage_account.sa.name}"
  container_access_type = "private"
}