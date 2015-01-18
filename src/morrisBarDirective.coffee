class morrisBar
  constructor: () ->
  restrict: 'A'
  scope:
    morrisBarData: '='
    morrisBarX: '@'
    morrisBarY: '@'
    morrisBarLabels: '@'
  link: (scope, element) ->
    scope.$watch 'morrisBarData', ->
      if scope.morrisBarData
        if !scope.morrisBarInstance
          scope.barInstance = new Morris.Bar
            element: element
            data: scope.morrisBarData
            xkey: scope.morrisBarX
            ykeys: JSON.parse scope.morrisBarY
            labels: JSON.parse scope.morrisBarLabels
            xLabelMargin: 2
        else
          scope.morrisBarInstance.setData scope.morrisBarData

angular
  .module 'angular-morris'
  .directive 'morrisBar', -> new morrisBar
