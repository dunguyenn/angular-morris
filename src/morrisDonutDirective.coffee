class MorrisDonut
  constructor: () ->
    @restrict = 'EA'
    @scope =
      data: '=morrisDonutData'
      options: '=morrisDonutOptions'

  link: (scope, element) ->
    scope.$watch 'data', ->
      if scope.data
        if !scope.morrisDonutInstance
          config = angular.copy scope.options
          config.element = element
          config.data = scope.data
          scope.morrisDonutInstance = new Morris.Donut config
        else
          scope.morrisDonutInstance.setData scope.data

MorrisDonut.$inject = ['$scope', '$element']

angular
  .module 'angular-morris'
  .directive 'morrisDonut', -> new MorrisDonut
