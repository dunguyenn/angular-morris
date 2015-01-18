class morrisBar
  constructor: () ->
  restrict: 'A'
  scope:
    morrisData: '='
    morrisBarX: '@'
    morrisBarY: '@'
    morrisBarLabels: '@'
  link: (scope, element) ->
    scope.$watch 'morrisBarData', ->
      if scope.morrisData
        if !scope.morrisBarInstance
          scope.morrisBarInstance = new Morris.Bar
            element: element
            data: scope.morrisData
            xkey: scope.morrisBarX
            ykeys: JSON.parse scope.morrisBarY
            labels: JSON.parse scope.morrisBarLabels
            xLabelMargin: 2
        else
          scope.morrisBarInstance.setData scope.morrisData

angular
  .module 'angular-morris'
  .directive 'morrisBar', -> new morrisBar
