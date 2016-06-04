angular.module('app')
.config ($routeProvider) ->

  $routeProvider.when '/sectors',
    templateUrl: 'sectors/index.html'
    controller: 'SectorsIndexCtrl'

  $routeProvider.when '/extinguishers',
    templateUrl: 'extinguishers/index.html'
    controller: 'ExtinguishersIndexCtrl'

  .otherwise
    redirectTo: '/extinguishers'
