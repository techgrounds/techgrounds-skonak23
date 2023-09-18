param location string = resourceGroup().location


param manageVmName string = 'adminserver'

@description('Username-management')
@secure()
param ManagementUName string 


@description('Managemnt-pw')
@secure()
param ManagementPW string 

@description('Zone number for the virtual machine')
@allowed([
  '1'
])
param zone string = '1'


@description('subnet_id from vnet2')
param subnet2 string


param ManageVmSize string = 'Standard_B2s'

@description('Unique DNS Name for the Public IP used to access the Virtual Machine.')
param dnsLabelPrefix string = toLower('${manageVmName}-${uniqueString(resourceGroup().id)}')

var virtualMachineName = 'VM-Adminserver'


var networkInterfaceName = '${ManagementUName}NetInt'
var osDiskType = 'Standard_LRS'
var publicIPAddressName = '${manageVmName}PublicIP'




resource publicIPAddress 'Microsoft.Network/publicIPAddresses@2023-04-01' = {
  name: publicIPAddressName
  location: location
  zones: [
    zone
  ]
  sku: {
    name: 'Standard'
  }
  properties: {
    publicIPAllocationMethod: 'Static'
    publicIPAddressVersion: 'IPv4'
    dnsSettings: {
      domainNameLabel: dnsLabelPrefix
    }
    idleTimeoutInMinutes: 4
  }
}




resource adminServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachineName
  location: location
  zones: [
    zone
  ]
  properties: {
    hardwareProfile: {
      vmSize: ManageVmSize
    }
    storageProfile: {
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: osDiskType
        }
      }
        imageReference: {
          publisher: 'MicrosoftWindowsServer'
          offer: 'WindowsServer'
          sku: '2022-datacenter-azure-edition' //https://learn.microsoft.com/en-us/azure/virtual-machines/windows/quick-create-bicep?tabs=CLI
          version: 'latest'
        }
      }
      osProfile: {
        computerName: manageVmName
        adminUsername: ManagementUName
        adminPassword: ManagementPW
      }
      networkProfile: {
        networkInterfaces: [
          {
            id: networkInterface.id
            properties: {
              deleteOption: 'Delete'
            }
          }
        ]
      }        
      }
    }


resource networkInterface 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: networkInterfaceName
  location: location
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig2'
        properties: {
          subnet: {
            id: subnet2           }
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
    
        
   }
}







