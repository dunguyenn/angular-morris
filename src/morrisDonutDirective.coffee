class morrisDonut
  constructor: () ->
  restrict: 'A',
  scope:
    data: '=morrisDonutData'
    colors: '=morrisDonutColors'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisDonutData', ->
      if scope.data
        if !scope.morrisDonutInstance
          scope.morrisDonutInstance = new Morris.Donut
            element: element
            data: scope.data
            colors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
#            resize: true
        else
          scope.morrisDonutInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisDonut', -> new morrisDonut
