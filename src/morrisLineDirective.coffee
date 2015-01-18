class morrisLine
  constructor: () ->
  restrict: 'A'
  scope:
    morrisLineData: '='
    morrisLineXkey: '@'
    morrisLineYkeys: '@'
    morrisLineLabels: '@'
    morrisLineColors: '@'
  link: (scope, element) ->
    if scope.morrisLineColors == undefined || scope.morrisLineColors == ''
      colors = null
    else
      colors = JSON.parse scope.morrisLineColors
    scope.$watch 'morrisLineData', ->
      if scope.morrisLineData
        if !scope.morrisLineInstance
          scope.morrisLineInstance = new Morris.Line
            element: element
            data: scope.morrisLineData
            xkey: scope.morrisLineXkey
            ykeys: JSON.parse scope.morrisLineYkeys
            labels: JSON.parse scope.morrisLineLabels
            lineColors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
        else
          scope.morrisLineInstance.setData scope.morrisLineData

angular
  .module 'angular-morris'
  .directive 'morrisLine', -> new morrisLine
