variable "resource_group_name" {
  description = "resource group name"
  type        = string
}

locals {
  storage_account_name = "sataotftest1"
  container_name       = "test"
  tags = {
    "function"    = "test"
    "environment" = "development"
  }
}

module "storage_account" {
  source               = "./modules/storage-account"
  resource_group_name  = var.resource_group_name
  storage_account_name = local.storage_account_name
  tags                 = local.tags
}

module "blob_container" {
  source               = "./modules/blob-container"
  storage_account_name = module.storage_account.name
  blob_container_name  = local.container_name
}
