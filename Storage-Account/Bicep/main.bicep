var storage_account_name = 'sataobiceptest1'
var container_name = 'test'
var tags = {
  function: 'test'
  environment: 'development'
}
module sa './modules/storage-account/main.bicep' = {
  name: storage_account_name
  params: {
    location: resourceGroup().location
    name: storage_account_name
    tags: tags
  }
}

module container './modules/blob-container/main.bicep' = {
  name: container_name
  params: {
    storage_account_name: sa.outputs.name
    blob_container_name: container_name
  }
}
