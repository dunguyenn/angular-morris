class morrisBar
  constructor: (@scope) ->
    @restrict = 'EA'
    @scope =
      data: '=morrisBarData'
      options: '=morrisBarOptions'

  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisBarData', ->
      if scope.data
        if !scope.morrisBarInstance
          config = angular.extend {}, {
            element: element
            data: scope.data
          }, scope.options
          scope.morrisBarInstance = new Morris.Bar config
        else
          scope.morrisBarInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisBar', -> new morrisBar
