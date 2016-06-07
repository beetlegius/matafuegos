sectorForm = ->
  return {
    restrict: 'E'
    replace: true
    templateUrl: 'directives/sector-form.html'
    scope:
      sector: '='
    controller: ($scope, Sector) ->
      $scope.submit = (sector) ->
        new Sector(sector).$save().then (result) ->
          $scope.sector = {}

          $scope.current_scope.sectors.push(result)
          $scope.current_scope.current_sector = result
          $scope.current_scope.tabActive = 'list'
        return
  }

angular.module('app').directive 'sectorForm', sectorForm
