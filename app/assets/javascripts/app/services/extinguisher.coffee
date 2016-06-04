ExtinguisherFactory = ($resource) ->
  base_url = 'http://localhost:3000'
  full_url = base_url + '/api/extinguishers/:id/:action'
  return $resource full_url, { id: "@id" },
    renew:
      method: 'PATCH'
      params: { action: 'renew' }
    update:
      method: 'PATCH'

angular.module('app').factory 'Extinguisher', ExtinguisherFactory
