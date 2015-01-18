class morrisLine
  constructor: () ->
  restrict: 'EA'
  scope:
    data: '=morrisLineData'
    xkey: '=morrisLineXkey'
    ykeys: '=morrisLineYkeys'
    labels: '=morrisLineLabels'
    colors: '=morrisLineColors'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisLineData', ->
      if scope.data
        if !scope.morrisLineInstance
          scope.morrisLineInstance = new Morris.Line
            element: element
            data: scope.data
            xkey: scope.xkey
            ykeys: scope.ykeys
            labels: scope.labels
#            resize: true
            lineColors: colors || ['#0b62a4', '#7a92a3', '#4da74d', '#afd8f8', '#edc240', '#cb4b4b', '#9440ed']
        else
          scope.morrisLineInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisLine', -> new morrisLine
