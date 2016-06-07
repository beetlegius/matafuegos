indexCtrl = ($scope, Sector) ->
  $scope.$parent.title = 'Sectors'

  $scope.sectors = Sector.query()
  $scope.tabActive = 'list'

  $scope.newSector = {}

  $scope.setCurrentSector = (sector) ->
    $scope.current_sector = sector
    return

  return

angular.module('app').controller 'SectorsIndexCtrl', indexCtrl
