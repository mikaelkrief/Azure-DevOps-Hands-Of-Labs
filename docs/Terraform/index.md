---
layout: default
title: Start with Terraform on Azure
parent: Terraform
nav_order: 2
---


# Starting with Terraform on Azure #

[Terrafom](https://www.terraform.io/){:target="_blank"} from HashiCorp is Infrastructure As code tool that allows to provision resources in Azure with a very simple language (HCL).

Advantages of Terraform are:

- It is open source with a large active community.
- It’s Multi Cloud provider (Azure, AWS, OpenStack, …..)
- It’s multi-platforms: work on Linux, Windows, Mac OS, …
- It allows to preview the changes that it will apply before its application (with the plan command).
- It runs in command line, so it can be integrated in an automated DevOps pipeline.
- The command line tool has some very useful options (which we will see as we go along).
- and many others ….

## Installation of Terraform

For download ans install Terraform see the official page [here](https://www.terraform.io/downloads.html){:target="_blank"}, and this [stackoverflow](https://stackoverflow.com/questions/14637979/how-to-permanently-set-path-on-linux-unix) page for set Path on Linux.

You can also execute this shell script directly on your linux for automate the download and installation of Terraform.

```bash
wget https://releases.hashicorp.com/terraform/0.11.7/terraform_0.11.7_linux_amd64.zip -O terraform.zip
unzip terraform.zip
mv terraform /home/${USER}/.local/bin/
if [[ “:$PATH:” == *”:$HOME/.local/bin”* ]]; then echo “Your path is correctly set” else PATH=$PATH:/home/${USER}/.local/bin export PATH fi
```

Thanks to [Etienne Deneuve](https://etienne.deneuve.xyz/2018/06/26/documentation-as-code/) for this script.

After the installation, you can test your installation of Terraform by executing the command `terraform –version` for display the version of your terraform, or run the command: `terraform` for display all command options.

![terraform command]({{ site.url }}/images/Terraform-Azure-1/image_thumb.png)

## Configuration of the Azure resources access

For authorize Terraform to manage resources on Azure, we need to create a Azure AD service principal that have authorizations for manage (create, update, delete) Azure resources.

For create this service principal manually from the Azure portal:

[https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal](https://docs.microsoft.com/en-us/azure/azure-resource-manager/resource-group-create-service-principal-portal){:target="_blank"}

It’s also possible to create this service principal by using the Azure cli 2.0

[https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest](https://docs.microsoft.com/en-us/cli/azure/create-an-azure-service-principal-azure-cli?view=azure-cli-latest){:target="_blank"}

## Create resources on Azure with Terraform

When Terraform is installed and your Azure Service principal is created, you can start to provision your Azure infrastructure.

For this, in the Terraform code (tf file) you must define the Azurerm provider and then define your Azure resources to provision.
The official documentation for the provider and resources is very great and fully : [https://www.terraform.io/docs/providers/azurerm/](https://www.terraform.io/docs/providers/azurerm/){:target="_blank"}

In the Microsoft documentation you can see the complete Terraform code for provision Linux VM in Azure : [https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-create-complete-vm](https://docs.microsoft.com/en-us/azure/virtual-machines/linux/terraform-create-complete-vm){:target="_blank"}

Other samples of Terraform code for Azure are available in [GitHub](https://github.com/terraform-providers/terraform-provider-azurerm/tree/master/examples){:target="_blank"}.
