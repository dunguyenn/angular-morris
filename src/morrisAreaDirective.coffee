class morrisArea
  constructor: () ->
  restrict: 'EA'
  scope:
    data: '=morrisAreaData'
    xkey: '=morrisAreaXkey'
    ykeys: '=morrisAreaYkeys'
    labels: '=morrisAreaLabels'
    colors: '=morrisAreaColors'
  link: (scope, element) ->
    if scope.colors == undefined || scope.colors == ''
      colors = null
    else
      colors = scope.colors
    scope.$watch 'morrisAreaData', ->
      if scope.data
        if !scope.morrisAreaInstance
          scope.morrisAreaInstance = new Morris.Area
            element: element
            data: scope.data
            xkey: scope.xkey
            ykeys: scope.ykeys
            labels: scope.labels
            lineColors: colors || ['#0b62a4', '#7a92a3', '#4da74d']
#            resize: true
        else
          scope.morrisAreaInstance.setData scope.data

angular
  .module 'angular-morris'
  .directive 'morrisArea', -> new morrisArea
