class MorrisBar
  constructor: () ->
    @restrict = 'EA'
    @scope =
      data: '=morrisBarData'
      options: '=morrisBarOptions'

  link: (scope, element) ->
    scope.$watch 'data', ->
      if scope.data
        if !scope.morrisBarInstance
          config = angular.copy scope.options
          config.element = element
          config.data = scope.data
          scope.morrisBarInstance = new Morris.Bar config
        else
          scope.morrisBarInstance.setData scope.data

MorrisBar.$inject = ['$scope', '$element']

angular
  .module 'angular-morris'
  .directive 'morrisBar', -> new MorrisBar
