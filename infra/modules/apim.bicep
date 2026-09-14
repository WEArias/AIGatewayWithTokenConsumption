param apimName string
param location string
param publisherName string
param publisherEmail string

resource apim 'Microsoft.ApiManagement/service@2024-06-01-preview' = {
  name: apimName
  location: location

  sku: {
    name: 'Developer'
    capacity: 1
  }

  properties: {
    publisherName: publisherName
    publisherEmail: publisherEmail
  }
}

output apimName string = apim.name
output apimResourceId string = apim.id
