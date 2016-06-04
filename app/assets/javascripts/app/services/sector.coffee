SectorFactory = ($resource) ->
  base_url = 'http://localhost:3000'
  full_url = base_url + '/api/sectors/:id'
  return $resource full_url, { id: "@id" },
    update:
      method: 'PATCH'

angular.module('app').factory 'Sector', SectorFactory
