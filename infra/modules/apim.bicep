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

resource api 'Microsoft.ApiManagement/service/apis@2024-06-01-preview' = {
  parent: apim
  name: 'hello-api'
  properties: {
    displayName: 'Hello API'
    path: 'hello'
    protocols: [
      'https'
    ]
    serviceUrl: 'https://httpbin.org'
  }
}

resource helloOperation 'Microsoft.ApiManagement/service/apis/operations@2024-06-01-preview' = {
  parent: api
  name: 'get-hello'
  properties: {
    displayName: 'Get Hello'
    method: 'GET'
    urlTemplate: '/hello'
    responses: [
      {
        statusCode: 200
        description: 'Successful response'
      }
    ]
  }
}

output apimName string = apim.name
output apimResourceId string = apim.id
output apiName string = api.name
