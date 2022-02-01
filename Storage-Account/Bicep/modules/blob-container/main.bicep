param storage_account_name string
param blob_container_name string

resource container 'Microsoft.Storage/storageAccounts/blobServices/containers@2021-06-01' = {
  name: '${storage_account_name}/Default/${blob_container_name}'
  properties: {
    publicAccess: 'None'
  }
}
output name string = container.name
