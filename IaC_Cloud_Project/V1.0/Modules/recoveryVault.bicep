param location string = resourceGroup().location

@description('Name of Vault')
param vaultName string = 'RecoVault-${uniqueString(resourceGroup().id)}'

// @description('Change Vault Storage Type (Works if vault has not registered any backup instance)')
// @allowed([
//   'LocallyRedundant'
//   'GeoRedundant'
// ])
// // param vaultStorageType string = 'LocallyRedundant'

var skuName = 'RS0'
var skuTier = 'Standard'

param policyName string = 'BackupPolicyWeb'


resource recoveryServiceVault 'Microsoft.RecoveryServices/vaults@2023-04-01' = {
  name: vaultName
  location: location
  sku: {
    name: skuName
    tier: skuTier
  }
  properties: {
    publicNetworkAccess: 'Disabled'
  }
}


resource backupPolicy 'Microsoft.RecoveryServices/vaults/backupPolicies@2023-04-01' = {
  parent: recoveryServiceVault
  name: policyName
  location: location
  properties: {
    backupManagementType: 'AzureIaasVM'
    instantRpRetentionRangeInDays: 3
    schedulePolicy: {
      scheduleRunFrequency: 'Daily'
      scheduleRunTimes: ['2023-09-15T00:00:00Z']
      schedulePolicyType: 'SimpleSchedulePolicy'
    }
    retentionPolicy: {
      dailySchedule: {
        retentionTimes: [
          '2023-09-15T00:00:00Z'
        ]
        retentionDuration: {
          count: 7
          durationType: 'Days'
        }
      }
      retentionPolicyType: 'LongTermRetentionPolicy'
    }
    timeZone: 'W. Europe Standard Time'
  }
}


