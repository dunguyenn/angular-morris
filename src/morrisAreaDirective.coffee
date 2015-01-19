class morrisArea
  constructor: (@scope) ->
    @restrict = 'EA'
    @scope =
      data: '=morrisAreaData'
      options: '=morrisAreaOptions'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisAreaData', ->
      if scope.data
        if !scope.morrisAreaInstance
          config = angular.extend {}, {
            element: element
            data: scope.data
          }, scope.options
          scope.morrisAreaInstance = new Morris.Area config
        else
          scope.morrisAreaInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisArea', -> new morrisArea
