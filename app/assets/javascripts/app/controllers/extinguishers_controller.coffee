indexCtrl = ($scope, Extinguisher, Sector) ->
  $scope.$parent.title = 'Extinguishers'

  $scope.extinguishers = Extinguisher.query()
  $scope.sectors = Sector.query()

  $scope.search = {
    order: 'expiration_at'
  }
  $scope.tabActive = 'list'

  $scope.kinds = ['A', 'AB', 'ABC', 'BC', 'D', 'K']

  $scope.newExtinguisher = {}

  $scope.setCurrentExtinguisher = (extinguisher) ->
    $scope.current_extinguisher = extinguisher
    return

  $scope.renew = (extinguisher) ->
    extinguisher.$renew()
    return

  $scope.submit = (extinguisher) ->
    new Extinguisher(extinguisher).$save().then (result) ->
      $scope.extinguishers.push(result)
      $scope.current_extinguisher = result
      delete $scope.search.sector
      $scope.newExtinguisher = {}
      $scope.tabActive = 'list'

  return

angular.module('app').controller 'ExtinguishersIndexCtrl', indexCtrl
