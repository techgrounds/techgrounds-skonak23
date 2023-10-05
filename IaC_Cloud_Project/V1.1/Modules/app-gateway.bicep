
param location string = resourceGroup().location

@description('Zone number for the virtual machine')
@allowed([
  '2'
])
param zone string = '2'

@description('adminUserName VMSS')
@secure()
param adminUsername string

@description('Admin_PW')
@secure()
param adminPasswordOrKey string


param vnet1_name string = 'vNet1'


param vmsSKU string = 'Standard_B1s'

@description('number of VM instances')
param instanceCount int

@description('Name VMSS')
param vmss_Name string 



@description('app gateway and subnet name')
param app_gateway_name string = 'app_gateway'
param appGwSubnetName string




var imageReference = {
  'Ubuntu-2204': {
    publisher: 'Canonical'
    offer: '0001-com-ubuntu-server-jammy'
    sku: '22_04-lts-gen2'
    version: 'latest'
  }
}


// param vnet1_name_webserver string
var vmScaleSetName = toLower(substring('${vmss_Name}${uniqueString(resourceGroup().id)}', 0, 9))
var publicIPAddressName = 'FrontEndPublicIP'
var bePoolName = '${vmss_Name}bepool'
var nicName = '${vmss_Name}nic'
var ipConfigName = '${vmss_Name}ipconfig'
var backendPoolName = '${vmScaleSetName}BackEndPool'


var linuxConfiguration = {
  disablePasswordAuthentication: true
  ssh: {
    publicKeys: [
      {
        path: '/home/${adminUsername}/.ssh/authorized_keys'
        keyData: adminPasswordOrKey
      }
    ]
  }
}


resource vnet1 'Microsoft.Network/virtualNetworks@2023-04-01' existing = {
  name: vnet1_name
}


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
  }
}



resource app_gateway 'Microsoft.Network/applicationGateways@2023-04-01' = {
  name: app_gateway_name
  location: location
  properties: {
    sku: {
      name: 'Standard_v2'
      tier: 'Standard_v2'
    }
    gatewayIPConfigurations: [
      {
        name: 'appGatewayIpConfig'
        properties: {
          subnet: {
            id: vnet1.properties.subnets[1].id
          }
        }
      }
    ]
    frontendIPConfigurations: [
      {
        name: 'appGwPublicFrontendIp'
        properties: {
          privateIPAllocationMethod: 'Dynamic'
          publicIPAddress: {
            id: publicIPAddress.id
          }
        }
      }
    ]
    frontendPorts: [
      {
        name: 'port_http'
        properties: {
          port: 80
        }
      }
      {
        name: 'port_https'
        properties: {
          port: 443
        }
      }
    ]
    backendAddressPools: [
      {
        name: backendPoolName
        properties: {}
      }
    ]
    backendHttpSettingsCollection: [
      {
        name: 'BackendHTTPSetting'
        properties: {
          port: 80
          protocol: 'Http'
          cookieBasedAffinity: 'Disabled'
          pickHostNameFromBackendAddress: false
          requestTimeout: 20
        }
      }
    ]
    sslCertificates: [
      {
        name: 'certificateSSL'
        properties: {
          data: loadFileAsBase64('Keys/key.pfx')
          password: 'testtest'
        }
      }
    ]
    httpListeners: [
      {
        name: 'httpListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', app_gateway_name, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', app_gateway_name, 'port_http')
          }
          protocol: 'Http'
          requireServerNameIndication: false
        }
      }
      {
        name: 'httpsListener'
        properties: {
          frontendIPConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendIPConfigurations', app_gateway_name, 'appGwPublicFrontendIp')
          }
          frontendPort: {
            id: resourceId('Microsoft.Network/applicationGateways/frontendPorts', app_gateway_name, 'port_https')
          }
          protocol: 'Https'
          requireServerNameIndication: false
          sslCertificate: {
            id: resourceId('Microsoft.Network/applicationGateways/sslCertificates', app_gateway_name, 'certificateSSL')
          }
        }
      }
    ]
    redirectConfigurations: [
      {
        name: 'appGwRedirectConfig'
        properties: {
          redirectType: 'Permanent'
          targetListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', app_gateway_name, 'HttpsListener')
          }
        }
      }
    ]
    requestRoutingRules: [
      {
        name: 'RoutingRuleHttps'
        properties: {
          ruleType: 'Basic'
          priority: 100
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', app_gateway_name, 'httpsListener')
          }
          backendAddressPool: {
            id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools', app_gateway_name, backendPoolName)
          }
          backendHttpSettings: {
            id: resourceId('Microsoft.Network/applicationGateways/backendHttpSettingsCollection', app_gateway_name, 'BackendHTTPSetting')
          }
        }
      }
      {
        name: 'RoutingRuleHttp'
        properties: {
          ruleType: 'Basic'
          priority: 10
          httpListener: {
            id: resourceId('Microsoft.Network/applicationGateways/httpListeners', app_gateway_name, 'httpListener')
          }
          redirectConfiguration: {
            id: resourceId('Microsoft.Network/applicationGateways/redirectConfigurations', app_gateway_name, 'appGwRedirectConfig')
          } 
        }
      }
    ]
    enableHttp2: false
    autoscaleConfiguration: {
      minCapacity: 1
      maxCapacity: 3
    }
  }
  dependsOn: [
    publicIPAddress
    vnet1
  ]
}



resource vmScaleSet 'Microsoft.Compute/virtualMachineScaleSets@2023-03-01' = {
  name: vmss_Name
  location: location
  sku: {
    name: vmsSKU
    tier: 'Standard'
    capacity: instanceCount
  }
  properties: {
    automaticRepairsPolicy: {
      enabled: true
      gracePeriod: 'PT10M'
    }
    overprovision: true
    upgradePolicy: {
      mode: 'Automatic'
    }
    singlePlacementGroup: true
    platformFaultDomainCount: 1
    virtualMachineProfile: {
      storageProfile: {
        osDisk: {
          caching: 'ReadWrite'
          createOption: 'FromImage'
        }
        imageReference: imageReference['Ubuntu-2204']
      }
      osProfile: {
        computerNamePrefix: vmScaleSetName
        adminUsername: adminUsername
        adminPassword: adminPasswordOrKey
        customData: loadFileAsBase64('scriptData.sh')
        linuxConfiguration: {
          disablePasswordAuthentication: true
          ssh: {
            publicKeys: [
              {
                path: '/home/${adminUsername}/.ssh/authorized_keys'
                keyData: loadTextContent('Keys/sshkey.pub')
              }
            ]
          }
        }
      }
      networkProfile: {
        networkInterfaceConfigurations: [
          {
            name: nicName
            properties: {
              primary: true
              ipConfigurations: [
                {
                  name: ipConfigName
                  properties: {
                    subnet: {
                      id: vnet1.properties.subnets[0].id
                    }
                    applicationGatewayBackendAddressPools: [
                      {
                        id: resourceId('Microsoft.Network/applicationGateways/backendAddressPools/', app_gateway_name, backendPoolName)
                      }
                    ]
                  }
                }
              ]
            }
          }
        ]
      }
      extensionProfile: {
        extensions: [
         {
          name: 'HealthExtension'
          properties: {
            publisher: 'Microsoft.ManagedServices'
            type: 'ApplicationHealthLinux'
            autoUpgradeMinorVersion: true
            typeHandlerVersion: '1.0'
            settings: {
              protocol: 'http'
              port: 80
            }
          }
         }  
        ]
      }
    }
  }
  dependsOn: [
    app_gateway
  ] 
}


resource autoscaler 'Microsoft.Insights/autoscalesettings@2022-10-01' = {
  name: 'autoscaler'
  location: location
  properties: {
    enabled: true
    name: 'autoscaler'
    profiles: [
      {
        name: 'profile1'
        capacity: {
          default: '1'
          maximum: '3'
          minimum: '1'
        }
        rules: [
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              operator: 'GreaterThan'
              statistic: 'Average'
              threshold: 70
              timeAggregation: 'Average'
              timeGrain: 'PT1M'
              timeWindow: 'PT5M'
            }
            scaleAction: {
              cooldown: 'PT1M'
              direction: 'Increase'
              type: 'ChangeCount'
              value: '1'
            }
          }
          {
            metricTrigger: {
              metricName: 'Percentage CPU'
              metricResourceUri: vmScaleSet.id
              timeGrain: 'PT1M'
              statistic: 'Average'
              timeWindow: 'PT5M'
              timeAggregation: 'Average'
              operator: 'LessThan'
              threshold: 30
            }
            scaleAction: {
              direction: 'Decrease'
              type: 'ChangeCount'
              value: '1'
              cooldown: 'PT1M'
            }
          }
        ]
      }
    ]
    targetResourceUri: vmScaleSet.id
  }
}





