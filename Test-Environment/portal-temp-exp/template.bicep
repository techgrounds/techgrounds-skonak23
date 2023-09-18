param virtualMachines_vm1_web_name string = 'vm1-web'
param sshPublicKeys_vm1_web_key_name string = 'vm1-web_key'
param networkInterfaces_vm1_web563_name string = 'vm1-web563'
param virtualNetworks_vm1_web_vnet_name string = 'vm1-web-vnet'
param networkSecurityGroups_vm1_web_nsg_name string = 'vm1-web-nsg'
param virtualNetworks_vnet2_externalid string = '/subscriptions/7e039311-9787-41be-814d-5e41e875ff8f/resourceGroups/AZ_Project_IaC_Techgrounds/providers/Microsoft.ClassicNetwork/virtualNetworks/vnet2'



resource sshPublicKeys_vm1_web_key_name_resource 'Microsoft.Compute/sshPublicKeys@2023-03-01' = {
  name: sshPublicKeys_vm1_web_key_name
  location: 'westeurope'
  properties: {
    publicKey: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTk3GFjlne37vr9kMnkioqgkjymjsoPq1BTEE5dV3uSlNQ8PRLpoA8S9RqayZ4bWxIagzdiYD40wXVfOaHEj4yZiu4Rk4QWN3B3K9PvSn7jfrGNljhE0SU4VvBTQseV6LD7HQ5ABEx3a0HuSOEG5fB3jm7k0Cd4VW/ZdlGWgHY23j2UaeafVQI1YrT6r5NYyccfOVphmk+iDSURUuAvfMZQthhu4dHavgOFSG8Lr3qKB88k7xqSPhahhA7i436m+4qAJeyKomxyUYCj60PlXYmGULxhYC5xUqc9MZQXVnVVo2JmyJO91S5Ti5t7GIZDTPPkIc5a3vFzGSCGqoi1fQlyl+GNPF0P2PUqCLFftZATIj+l1NpaIKqivjnMt9/b3TMijWl0Wy+rdiF2ROyYmlg6S3qiT94mvKtOyH6sOCfJykycBOe2k1VheyVTgUypvFd6dOeDw4l+FrL0h9T6oGNLJ0NYXVCnreoOczunPP0TcgtaElrwl8+f2kBAPvfSN0= generated-by-azure'
  }
}

resource networkSecurityGroups_vm1_web_nsg_name_resource 'Microsoft.Network/networkSecurityGroups@2023-04-01' = {
  name: networkSecurityGroups_vm1_web_nsg_name
  location: 'westeurope'
  properties: {
    securityRules: [
      {
        name: 'SSH'
        type: 'Microsoft.Network/networkSecurityGroups/securityRules'
        properties: {
          protocol: 'TCP'
          sourcePortRange: '*'
          destinationPortRange: '22'
          sourceAddressPrefix: '*'
          destinationAddressPrefix: '*'
          access: 'Allow'
          priority: 300
          direction: 'Inbound'
          sourcePortRanges: []
          destinationPortRanges: []
          sourceAddressPrefixes: []
          destinationAddressPrefixes: []
        }
      }
    ]
  }
}

resource virtualNetworks_vm1_web_vnet_name_resource 'Microsoft.Network/virtualNetworks@2023-04-01' = {
  name: virtualNetworks_vm1_web_vnet_name
  location: 'westeurope'
  properties: {
    addressSpace: {
      addressPrefixes: [
        '10.10.10.0/24'
      ]
    }
    subnets: [
      {
        name: 'subnet1'

        properties: {
          addressPrefix: '10.10.10.0/24'
          delegations: []
          privateEndpointNetworkPolicies: 'Disabled'
          privateLinkServiceNetworkPolicies: 'Enabled'
        }
        type: 'Microsoft.Network/virtualNetworks/subnets'
      }
    ]
    virtualNetworkPeerings: [
      {
        name: 'vnet1-vnet2'
        properties: {
          peeringState: 'Connected'
          peeringSyncLevel: 'FullyInSync'
          remoteVirtualNetwork: {
            id: virtualNetworks_vnet2_externalid
          }
          allowVirtualNetworkAccess: true
          allowForwardedTraffic: false
          allowGatewayTransit: false
          useRemoteGateways: false
          doNotVerifyRemoteGateways: false
          remoteAddressSpace: {
            addressPrefixes: [
              '10.20.20.0/24'
            ]
          }
          remoteVirtualNetworkAddressSpace: {
            addressPrefixes: [
              '10.20.20.0/24'
            ]
          }
        }
        type: 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings'
      }
    ]
    enableDdosProtection: false
  }
}

resource virtualMachines_vm1_web_name_resource 'Microsoft.Compute/virtualMachines@2023-03-01' = {
  name: virtualMachines_vm1_web_name
  location: 'westeurope'
  properties: {
    hardwareProfile: {
      vmSize: 'Standard_B1ls'
    }
    storageProfile: {
      imageReference: {
        publisher: 'canonical'
        offer: '0001-com-ubuntu-server-focal'
        sku: '20_04-lts-gen2'
        version: 'latest'
      }
      osDisk: {
        osType: 'Linux'
        name: '${virtualMachines_vm1_web_name}_OsDisk_1_f877a464f68844f6bf426898409df473'
        createOption: 'FromImage'
        caching: 'ReadWrite'
        managedDisk: {
          storageAccountType: 'StandardSSD_LRS'
          id: resourceId('Microsoft.Compute/disks', '${virtualMachines_vm1_web_name}_OsDisk_1_f877a464f68844f6bf426898409df473')
        }
        deleteOption: 'Delete'
        diskSizeGB: 30
      }
      dataDisks: []
      diskControllerType: 'SCSI'
    }
    osProfile: {
      computerName: virtualMachines_vm1_web_name
      adminUsername: 'azureuser'
      linuxConfiguration: {
        disablePasswordAuthentication: true
        ssh: {
          publicKeys: [
            {
              path: '/home/azureuser/.ssh/authorized_keys'
              keyData: 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDTk3GFjlne37vr9kMnkioqgkjymjsoPq1BTEE5dV3uSlNQ8PRLpoA8S9RqayZ4bWxIagzdiYD40wXVfOaHEj4yZiu4Rk4QWN3B3K9PvSn7jfrGNljhE0SU4VvBTQseV6LD7HQ5ABEx3a0HuSOEG5fB3jm7k0Cd4VW/ZdlGWgHY23j2UaeafVQI1YrT6r5NYyccfOVphmk+iDSURUuAvfMZQthhu4dHavgOFSG8Lr3qKB88k7xqSPhahhA7i436m+4qAJeyKomxyUYCj60PlXYmGULxhYC5xUqc9MZQXVnVVo2JmyJO91S5Ti5t7GIZDTPPkIc5a3vFzGSCGqoi1fQlyl+GNPF0P2PUqCLFftZATIj+l1NpaIKqivjnMt9/b3TMijWl0Wy+rdiF2ROyYmlg6S3qiT94mvKtOyH6sOCfJykycBOe2k1VheyVTgUypvFd6dOeDw4l+FrL0h9T6oGNLJ0NYXVCnreoOczunPP0TcgtaElrwl8+f2kBAPvfSN0= generated-by-azure'
            }
          ]
        }
        provisionVMAgent: true
        patchSettings: {
          patchMode: 'ImageDefault'
          assessmentMode: 'ImageDefault'
        }
        enableVMAgentPlatformUpdates: false
      }
      secrets: []
      allowExtensionOperations: true
      requireGuestProvisionSignal: true
    }
    networkProfile: {
      networkInterfaces: [
        {
          id: networkInterfaces_vm1_web563_name_resource.id
          properties: {
            deleteOption: 'Delete'
          }
        }
      ]
    }
  }
}

resource networkSecurityGroups_vm1_web_nsg_name_SSH 'Microsoft.Network/networkSecurityGroups/securityRules@2023-04-01' = {
  name: '${networkSecurityGroups_vm1_web_nsg_name}/SSH'
  properties: {
    protocol: 'TCP'
    sourcePortRange: '*'
    destinationPortRange: '22'
    sourceAddressPrefix: '*'
    destinationAddressPrefix: '*'
    access: 'Allow'
    priority: 300
    direction: 'Inbound'
    sourcePortRanges: []
    destinationPortRanges: []
    sourceAddressPrefixes: []
    destinationAddressPrefixes: []
  }
  dependsOn: [
    networkSecurityGroups_vm1_web_nsg_name_resource
  ]
}

resource virtualNetworks_vm1_web_vnet_name_subnet1 'Microsoft.Network/virtualNetworks/subnets@2023-04-01' = {
  name: '${virtualNetworks_vm1_web_vnet_name}/subnet1'
  properties: {
    addressPrefix: '10.10.10.0/24'
    delegations: []
    privateEndpointNetworkPolicies: 'Disabled'
    privateLinkServiceNetworkPolicies: 'Enabled'
  }
  dependsOn: [
    virtualNetworks_vm1_web_vnet_name_resource
  ]
}

resource virtualNetworks_vm1_web_vnet_name_vnet1_vnet2 'Microsoft.Network/virtualNetworks/virtualNetworkPeerings@2023-04-01' = {
  name: '${virtualNetworks_vm1_web_vnet_name}/vnet1-vnet2'
  properties: {
    peeringState: 'Connected'
    peeringSyncLevel: 'FullyInSync'
    remoteVirtualNetwork: {
      id: virtualNetworks_vnet2_externalid
    }
    allowVirtualNetworkAccess: true
    allowForwardedTraffic: false
    allowGatewayTransit: false
    useRemoteGateways: false
    doNotVerifyRemoteGateways: false
    remoteAddressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]
    }
    remoteVirtualNetworkAddressSpace: {
      addressPrefixes: [
        '10.20.20.0/24'
      ]
    }
  }
  dependsOn: [
    virtualNetworks_vm1_web_vnet_name_resource
  ]
}

resource networkInterfaces_vm1_web563_name_resource 'Microsoft.Network/networkInterfaces@2023-04-01' = {
  name: networkInterfaces_vm1_web563_name
  location: 'westeurope'
  properties: {
    ipConfigurations: [
      {
        name: 'ipconfig1'
        etag: 'W/"b5b83828-4c7c-4337-aa2d-1d14c0cd49b6"'
        type: 'Microsoft.Network/networkInterfaces/ipConfigurations'
        properties: {
          privateIPAddress: '10.10.10.4'
          privateIPAllocationMethod: 'Dynamic'
          subnet: {
            id: virtualNetworks_vm1_web_vnet_name_subnet1.id
          }
          primary: true
          privateIPAddressVersion: 'IPv4'
        }
      }
    ]
    dnsSettings: {
      dnsServers: []
    }
    enableAcceleratedNetworking: false
    enableIPForwarding: false
    disableTcpStateTracking: false
    networkSecurityGroup: {
      id: networkSecurityGroups_vm1_web_nsg_name_resource.id
    }
    nicType: 'Standard'
    auxiliaryMode: 'None'
    auxiliarySku: 'None'
  }
}
