indexCtrl = ($scope, Extinguisher, Sector) ->
  $scope.$parent.title = 'Extinguishers'

  $scope.extinguishers = Extinguisher.query()
  $scope.sectors = Sector.query()

  $scope.search = {
    order: 'expiration_at'
  }

  $scope.setCurrentExtinguisher = (extinguisher) ->
    $scope.current_extinguisher = extinguisher
    return

  $scope.renew = (extinguisher) ->
    extinguisher.$renew()
    return

  return

angular.module('app').controller 'ExtinguishersIndexCtrl', indexCtrl
