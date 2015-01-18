class morrisArea
  constructor: () ->
  restrict: 'A'
  scope:
    morrisData: '='
    morrisAreaXkey: '@'
    morrisAreaYkeys: '@'
    morrisAreaLabels: '@'
  link: (scope, element) ->
    scope.$watch 'morrisData', ->
      if scope.morrisData
        if !scope.morrisAreaInstance
          scope.morrisAreaInstance = new Morris.Area
            element: element
            data: scope.morrisData
            xkey: scope.morrisAreaXkey
            ykeys: JSON.parse scope.morrisAreaYkeys
            labels: JSON.parse scope.morrisAreaLabels
        else
          scope.morrisAreaInstance.setData scope.morrisData

angular
  .module 'angular-morris'
  .directive 'morrisArea', -> new morrisArea
