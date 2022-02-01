@description('Name of the Network Security Group')
param nsg_name string

var local_subnet = '10.101.1.0/24'
resource inbound_rule_http 'Microsoft.Network/networkSecurityGroups/securityRules@2021-05-01' = {
  name: '${nsg_name}/HTTP-Allow-In'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRanges: [
      '443'
      '80'
    ]
    sourceAddressPrefix: '10.0.0.0/8'
    destinationAddressPrefix: local_subnet
    access: 'Allow'
    priority: 210
    direction: 'Inbound'
  }
}

resource inbound_rule_mssql 'Microsoft.Network/networkSecurityGroups/securityRules@2021-05-01' = {
  name: '${nsg_name}/MSSQL-Allow-In'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRanges: [
      '1433'
      '1434'
      '59999'
    ]
    sourceAddressPrefix: '10.0.0.0/8'
    destinationAddressPrefix: local_subnet
    access: 'Allow'
    priority: 210
    direction: 'Inbound'
  }
}
