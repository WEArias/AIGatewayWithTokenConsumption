param environment string
param location string
param workload string
param namePrefix string
param nameSuffix string

var apimName = '${namePrefix}-${workload}-${environment}-apim-${nameSuffix}'
var storageName = toLower('${namePrefix}${workload}${environment}st${nameSuffix}')

module apim './modules/apim.bicep' = {
  name: 'deploy-apim-${environment}'
  params: {
    apimName: apimName
    location: location
    publisherName: 'Redwood Trust'
    publisherEmail: 'admin@example.com'
  }
}

module storage './modules/storage.bicep' = {
  name: 'deploy-storage-${environment}'
  params: {
    storageName: storageName
    location: location
    environment: environment
    workload: workload
  }
}

output apimName string = apim.outputs.apimName
output apimResourceId string = apim.outputs.apimResourceId
output storageAccountName string = storage.outputs.storageAccountName
output storageAccountId string = storage.outputs.storageAccountId
