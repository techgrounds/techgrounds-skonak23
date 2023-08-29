
param location string = resourceGroup().location

@description('Deploy StorageAccount')
module storage 'V1.0/Modules/storage.bicep' = {
  name: 'storageAccount_v0'
  params: {
    location: location
    storagePrefix: 'storeAc'
  }
}
 module network 'V1.0/Modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location

  }
 }
 