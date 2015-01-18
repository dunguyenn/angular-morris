class morrisDonut
  constructor: () ->
  restrict: 'A',
  scope:
    morrisDonutData: '='
  link: (scope, element) ->
    scope.$watch 'morrisDonutData', ->
      if scope.morrisDonutData
        if !scope.morrisDonutInstance
          scope.morrisDonutInstance = new Morris.Donut
            element: element
            data: scope.morrisDonutData
        else
          scope.morrisDonutInstance.setData scope.morrisDonutData

angular
  .module 'angular-morris'
  .directive 'morrisDonut', -> new morrisDonut
