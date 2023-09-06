
param location string = resourceGroup().location
// param environment string


@description('Username VM')
param vmName string = 'webserver1'

@description('Username VM')
param manageVmName string = 'adminserver'

// @description('subnet_id from vnet1')
// param subnet1 string

@description('adminUserName')
@secure()
param adminUsername string

@description('Admin_PW')
@secure()
param adminPasswordOrKey string

@description('keyvault name')
param KeyVaultName string = 'KeyVault'


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
module Webserver 'Modules/vm-webserver.bicep' = {
  name: vmName
  params: {
    location: location
    subnet1: network.outputs.subnet1 
    adminUsername: adminUsername
    adminPasswordOrKey: adminPasswordOrKey
  }
 }


@description('Deploy Adminserver')
module Adminserver 'Modules/management-server.bicep' = {
  name: manageVmName
  params: {
    location: location
    subnet2: network.outputs.subnet2
    ManagementUName: adminUsername
    ManagementPW: adminPasswordOrKey
  }
 }


@description('KeyVault')
module KeyVault 'Modules/KeyVault.bicep' = {
  name: KeyVaultName
  params: {
    location: location
    secretName: adminUsername
    secretValue: adminPasswordOrKey
  }
}
