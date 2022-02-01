@description('Name of the Network Security Group')
param nsg_name string

var local_subnet = '10.101.1.0/24'
resource inbound_rule_http 'Microsoft.Network/networkSecurityGroups/securityRules@2021-05-01' = {
  name: '${nsg_name}/SSH-Allow-In'
  properties: {
    protocol: 'Tcp'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefixes: [
      '10.0.0.0/8'
      '10.1.0.0/16'
    ]
    destinationAddressPrefix: local_subnet
    access: 'Allow'
    priority: 230
    direction: 'Inbound'
  }
}
