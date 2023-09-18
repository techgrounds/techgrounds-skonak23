
@description('Prefix for storage account name')
@minLength(3)
@maxLength(11)
param storagePrefix string

@allowed([
  'Standard_GRS'
  'Standard_RAGRS'
  'Standard_LRS'
])
param storageSKU string = 'Standard_LRS'
param location string =  resourceGroup().location


var uniqueStorageName = '${storagePrefix}${uniqueString(resourceGroup().id)}'


resource storageAccount_v0 'Microsoft.Storage/storageAccounts@2023-01-01' = {
  name: uniqueStorageName
  location: location
  sku: {
    name: storageSKU
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
    encryption: {
      keySource: 'Microsoft.Storage'
      services: {
        blob: {
          enabled: true
        }
        file: {
          enabled: true
        }
        queue: {
          enabled: true
        }
        table: {
          enabled: true
        }
      }
    }
  }

  }

  resource blob_service 'Microsoft.Storage/storageAccounts/blobServices@2023-01-01' = {
    name: 'default'
    parent: storageAccount_v0
    properties: {}
  }

  resource blob_container 'Microsoft.Storage/storageAccounts/blobServices/containers@2023-01-01' = {
    name: uniqueStorageName
    parent: blob_service
    properties:{}
  }

  output storAccEndP object = storageAccount_v0.properties.primaryEndpoints
  output uniqueStorageName string = storagePrefix


