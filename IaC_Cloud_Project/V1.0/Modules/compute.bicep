
param location string = resourceGroup().location
param environment string


@description('Username VM')
param vmName string = 'VM_WebServer'

@description('adminUserName')
@secure()
param adminUsername string

@description('Admin_PW')
@secure()
param adminPassword string

@description('Type of authentication to use on the Virtual Machine. SSH key is recommended.')
@allowed([
  'sshPublicKey'
  'password'
])
param authenticationType string = 'password'


param diskEncryption string

var imageReference = {
  'Ubuntu-1804': {
    publisher: 'Canonical'
    offer: 'UbuntuServer'
    sku: '18_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2004': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-focal'
    sku: '20_04-lts-gen2'
    version: 'latest'
  }
  'Ubuntu-2204': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-jammy'
    sku: '22_04-lts-gen2'
    version: 'latest'
  }
}

var networkInterfaceName = '${vmName}NetInt'

@description('VM_WebServer')
resource vm_WebServer 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: vmName
  location: location
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B2s'
    }
    storageProfile: {
      imageReference: imageReference
      }
      osDisk: {
        createOption: 'FromImage'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          diskEncryptionSet: {
            id: diskEncryption
          }
        }
      }
      osProfile: {
        computername: vmName
        adminUsername: adminUsername
        adminPassword: adminPassword
      }
      networkProfile: {
        
      }
    }
  }

  resource networkInterface 'Microsoft.Network/networkInterfaces@2021-05-01' = {
    name: networkInterfaceName
    location: location
    properties: {
      ipConfigurations: [
        {
          name: 'ipconfig1'
          properties: {
            subnet: {
              // id: subnet.id
            }
            privateIPAllocationMethod: 'Dynamic'
            publicIPAddress: {
              // id: publicIPAddress.id
            }
          }
        }
      ]
      networkSecurityGroup: {
        // id: networkSecurityGroup.id
      }
    }
  }


  module network 'network.bicep' = {
    name: 'networkDeployment'
    params: {
      location: location
  
    }
   }
   