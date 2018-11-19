/************************************************/
/************ VARIABLES ********************/
/************************************************/

variable "resource_group" {
  description = "The name of the resource group in which to create the resources."
}

variable "location" {
  description = "The location/region where the resources is created"
}

variable "project_name" {
  description = "The shortened abbreviation to represent your project name."
  default     = "holterraform"
}

variable "env_name" {
  description = "Environnment Name"
}

variable "admin_username" {
  description = "administrator user name"
  default     = "vmadmin"
}

variable "admin_password" {
  description = "vmpassword"
}
