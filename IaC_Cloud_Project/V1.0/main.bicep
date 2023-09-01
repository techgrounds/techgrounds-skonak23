
param location string = resourceGroup().location
// param environment string

@description('Username VM')
param vmName string = 'webserver1'

// @description('subnet_id from vnet1')
// param subnet1 string

@description('adminUserName')
@secure()
param adminUsername string

@description('Admin_PW')
@secure()
param adminPasswordOrKey string

@description('Deploy StorageAccount')
module storage 'Modules/storage.bicep' = {
  name: 'storaccdeploy'
  params: {
    location: location
    storagePrefix: 'storeac'
  }
}

@description('Deploy Network Environment')
 module network 'Modules/network.bicep' = {
  name: 'networkDeployment'
  params: {
    location: location
  }
 }


 @description('Deploy Webserver')
 module compute 'Modules/compute.bicep' = {
  name: vmName
  params: {
    location: location
    subnet1: network.outputs.subnet1 
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
  }
 }
