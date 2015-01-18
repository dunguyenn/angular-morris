class morrisArea
  constructor: () ->
  restrict: 'A'
  scope:
    morrisAreaData: '='
    morrisAreaXkey: '@'
    morrisAreaYkeys: '@'
    morrisAreaLabels: '@'
  link: (scope, element) ->
    scope.$watch 'morrisAreaData', ->
      if scope.morrisAreaData
        if !scope.morrisAreaInstance
          scope.morrisAreaInstance = new Morris.Area
            element: element
            data: scope.morrisAreaData
            xkey: scope.morrisAreaXkey
            ykeys: JSON.parse scope.morrisAreaYkeys
            labels: JSON.parse scope.morrisAreaLabels
        else
          scope.morrisAreaInstance.setData scope.morrisAreaData

angular
  .module 'angular-morris'
  .directive 'morrisArea', -> new morrisArea
