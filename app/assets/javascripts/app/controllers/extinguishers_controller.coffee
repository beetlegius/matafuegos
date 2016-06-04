indexCtrl = ($scope, Extinguisher) ->
  $scope.$parent.title = 'Extinguishers'

  $scope.extinguishers = Extinguisher.query()

  return

angular.module('app').controller 'ExtinguishersIndexCtrl', indexCtrl
