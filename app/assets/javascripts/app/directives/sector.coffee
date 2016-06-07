sector = ->
  return {
    restrict: 'E'
    replace: true
    templateUrl: 'directives/sector.html'
    scope:
      sector: '='
  }

angular.module('app').directive 'sector', sector
