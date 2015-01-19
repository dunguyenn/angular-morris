class morrisDonut
  constructor: (@scope) ->
    @restrict = 'EA'
    @scope =
      data: '=morrisDonutData'
      options: '=morrisDonutOptions'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisDonutData', ->
      if scope.data
        if !scope.morrisDonutInstance
          config = angular.extend {}, {
            element: element
            data: scope.data
          }, scope.options
          scope.morrisDonutInstance = new Morris.Donut config
        else
          scope.morrisDonutInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisDonut', -> new morrisDonut
