
/************************************************/
/************ PROVIDER AZURE ********************/
/************************************************/

provider "azurerm" {
}

/************************************************/
/************ VARIABLES ********************/
/************************************************/
variable "subscription_id" {
  description = "Azure subscription ID"
}

variable "client_id" {
  description = "Azure Application ID"
}


variable "tenant_id" {
  description = "Azure Tenant ID"
}

variable "resource_group_name" {
  description = "The name of the resource group in which to create the resources."
}

variable "location" {
  description = "The location/region where the resources is created"
}





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