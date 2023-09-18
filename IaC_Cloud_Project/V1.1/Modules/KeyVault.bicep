// Work in Progress



@description('Location of the resources')
param location string = resourceGroup().location

@description('Specifies the managed identity')
param managed_id string = 'userIDx${uniqueString(resourceGroup().id)}'

@description('Specifies the key vault name')
param keyVaultName string = 'Vault${uniqueString(resourceGroup().id)}'         //change name for conflict ?

@description('Specifies name of secrets')
param secretName string

@description('Specifies Value pw of secrets')
@secure()
param secretValue string


@description('Specifies whether the key vault is a standard vault or a premium vault.')
@allowed([
  'standard'
  'premium'
])
param skuName string = 'standard'

@description('Specifies the Azure Active Directory tenant ID that should be used for authenticating requests to the key vault.')
param tenantId string = subscription().tenantId

// param objectId string = '66780639-0522-4e99-84dc-63cb6642a1e2'


resource KeyVault 'Microsoft.KeyVault/vaults@2023-02-01' = {
  name: keyVaultName
  location: location
  properties: {
    accessPolicies: [
      {
        objectId: managedIdentity.properties.principalId
        permissions: {
          certificates: [
            'all', 'list', 'get'
          ]
          keys: [
            'all', 'list', 'get', 'unwrapKey', 'wrapKey'
          ]
          secrets: [
            'all', 'list', 'get'
          ]
          storage: [
            'all', 'list', 'get'
          ]
        }
        tenantId: tenantId
      }
    ]
    createMode: 'recover'
    enabledForDeployment: true
    enabledForDiskEncryption: true
    enabledForTemplateDeployment: true
    enablePurgeProtection: true        //remember to set this to true when code is done
    enableRbacAuthorization: false
    enableSoftDelete: true             //remember to set this to true when code is done
    publicNetworkAccess: 'Disabled'
    networkAcls: {
      bypass: 'AzureServices'
      defaultAction: 'Allow'
      ipRules: [
        {
          value: '82.168.144.116'    // My (local) public IP
        }
      ] 
    }
    sku: {
      family: 'A'
      name: skuName
    }
    softDeleteRetentionInDays: 7
    tenantId: tenantId
    vaultUri: 'string'
  }
}



resource managedIdentity 'Microsoft.ManagedIdentity/userAssignedIdentities@2023-01-31' = {
  name: managed_id
  location: location
}


resource secretsKV 'Microsoft.KeyVault/vaults/secrets@2023-02-01' = {
  parent: KeyVault
  name: secretName 
  properties: {
    value: secretValue
  }
}



output keyvaultName string = keyVaultName
output secretName string = secretName









