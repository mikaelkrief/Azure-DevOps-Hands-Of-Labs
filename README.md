# DevOps-Hands-Of-Lab

## Terraform in Azure ##

### Requirement ###

1- Download and Install Terraform from [Terraform](https://www.terraform.io/downloads.html) or you can use the [Azure Cloud Shell](https://docs.microsoft.com/fr-fr/azure/terraform/terraform-cloud-shell) or this [doc](https://docs.microsoft.com/fr-fr/azure/cloud-shell/example-terraform-bash)
2- Create an Azure Service Principal for manipulate Azure Resources , [see here](https://www.terraform.io/docs/providers/azurerm/authenticating_via_service_principal.html)
3- For the IDE: we can use any code editor, I use VSCode with adding [Terraform extension](https://marketplace.visualstudio.com/items?itemName=mauve.terraform), or use the Azure Cloud Shell Editor



### Samples ###

- V1-simplefile : example of Terraform code in single file
- V2-simplefile2 : same example with variables
- V3-multifile : example by using mutifiles (variable, main, var env)
- ex_vm : example for create Azure VM
- vm_modules : example for create VM by using Terraform custom modules + remotes backends
- vm_modules_registry : example for create VM by using Terraform modules from public registry

**Run the samples:**
1- Athenticate with Azure Service principal by using variables environments

```bash
export ARM_CLIENT_ID="xxxxx-xxxxxx-xxxxxx-xxxxx"
export ARM_CLIENT_SECRET="xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
export ARM_SUBSCRIPTION_ID="xxxxx-xxxxxx-xxxxxx-xxxxx"
export ARM_TENANT_ID="xxxxx-xxxxxx-xxxxxx-xxxxx"
```

2- execute Terraform Command
```bash
terraform init
terraform plan -var-file="xxxxx.tfvars"
terraform apply -var-file="xxxxx.tfvars"
```