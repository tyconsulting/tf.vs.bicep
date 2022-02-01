var pipName = 'pip-test-01'
resource pip 'Microsoft.Network/publicIPAddresses@2021-05-01' = {
  name: pipName
  location: resourceGroup().location
  properties: {
    publicIPAllocationMethod: 'Dynamic'
    publicIPAddressVersion: 'IPv4'
    idleTimeoutInMinutes: 4
  }
}
