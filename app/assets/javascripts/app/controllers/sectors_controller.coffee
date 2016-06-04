indexCtrl = ($scope, Sector) ->
  $scope.$parent.title = 'Sectors'

  $scope.sectors = Sector.query()

  return

angular.module('app').controller 'SectorsIndexCtrl', indexCtrl
