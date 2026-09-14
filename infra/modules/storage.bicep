param storageName string
param location string
param environment string
param workload string

resource storage 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageName
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  tags: {
    Environment: environment
    Workload: workload
    ManagedBy: 'Bicep'
  }
}

output storageAccountName string = storage.name
output storageAccountId string = storage.id
