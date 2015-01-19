class morrisLine
  constructor: (@scope) ->
    @restrict = 'EA'
    @scope =
      data: '=morrisLineData'
      options: '=morrisLineOptions'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
    else
      colors = scope.colors
    scope.$watch 'morrisLineData', ->
      if scope.data
        if !scope.morrisLineInstance
          config = angular.extend {}, {
            element: element
            data: scope.data
          }, scope.options
          scope.morrisLineInstance = new Morris.Line config
        else
          scope.morrisLineInstance.setData scope.data

morrisLine.$inject = ['$scope', '$element']

angular
  .module 'angular-morris'
  .directive 'morrisLine', -> new morrisLine
