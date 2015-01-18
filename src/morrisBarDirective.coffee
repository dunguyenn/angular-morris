class morrisBar
  constructor: () ->
  restrict: 'EA'
  scope:
    data: '=morrisBarData'
    barx: '=morrisBarX'
    bary: '=morrisBarY'
    labels: '=morrisBarLabels'
    colors: '=morrisBarColors'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisBarData', ->
      if scope.data
        if !scope.morrisBarInstance
          scope.morrisBarInstance = new Morris.Bar
            element: element
            data: scope.data
            xkey: scope.barx
            ykeys: scope.bary
            labels: scope.labels
            barColors: colors || ['#0b62a4', '#7a92a3', '#4da74d']
            xLabelMargin: 2
#            resize: true
        else
          scope.morrisBarInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisBar', -> new morrisBar
