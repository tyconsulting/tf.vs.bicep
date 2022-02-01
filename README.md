# Comparing ARM What-If and Terraform Plan

## Introduction

This repository contains the source code used by Tao Yang's blog post [Comparing Terraform Plan and Azure Resource Manager What-If](https://blog.tyang.org/2022/02/01/tf-plan-vs-bicep-what-if)

## Command Examples

### Terraform

#### Terraform Plan

```bash
terraform init
terraform plan
```

#### Terraform Apply

```bash
terraform apply --auto-approve
```

### Bicep with Azure CLI

#### Get What-If Result

```bash
rg="rg-tf-vs-bicep"
az deployment group what-if --resource-group $rg --template-file main.bicep --parameters main.parameters.json
```

#### Deploy Bicep Template

```bash
rg="rg-tf-vs-bicep"
az deployment group create --name "nsg-rules-test" --resource-group $rg --template-file main.bicep --parameters main.parameters.json
```
