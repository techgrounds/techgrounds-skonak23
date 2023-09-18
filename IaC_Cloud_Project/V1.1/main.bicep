targetScope = 'subscription'

param location string = 'uksouth'
// param environment string
//az deployment sub create --location uksouth  --template-file main.bicep

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

@description('Managed Identity KV')
param managed_id string = 'ManagedID-kv'

param rgName string = 'rootRG'


resource rootRG 'Microsoft.Resources/resourceGroups@2022-09-01' = {
  name: rgName
  location: location
}



@description('Deploy StorageAccount')
module storage 'Modules/storage.bicep' = {
  name: 'storaccdeploy'
  scope: rootRG
  params: {
    location: location
    storagePrefix: 'storeac'
  }
}


@description('Deploy Network Environment')
module network 'Modules/network.bicep' = {
  name: 'networkDeployment'
  scope: rootRG
  params: {
    location: location
  }
}


@description('Deploy Webserver')
module Webserver 'Modules/vm-webserver.bicep' = {
  name: vmName
  scope: rootRG
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
  scope: rootRG
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
  scope: rootRG
  params: {
    location: location
    managed_id: managed_id
    secretName: adminUsername
    secretValue: adminPasswordOrKey
  }
}


@description('RecoveryVault')
module recoveryVault 'Modules/recoveryVault.bicep' = {
  scope: rootRG
  name: 'rcvrySvcVault1'
  params: {
    vaultName: 'recVault10'
    location: location
  }
}





