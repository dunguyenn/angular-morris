class MorrisArea
  constructor: () ->
    @restrict = 'EA'
    @scope =
      data: '=morrisAreaData'
      options: '=morrisAreaOptions'

  link: (scope, element) ->
    scope.$watch 'data', ->
      if scope.data
        if !scope.morrisAreaInstance
          config = angular.copy scope.options
          config.element = element
          config.data = scope.data
          scope.morrisAreaInstance = new Morris.Area config
        else
          scope.morrisAreaInstance.setData scope.data

MorrisArea.$inject = ['$scope', '$element']

angular
  .module 'angular-morris'
  .directive 'morrisArea', -> new MorrisArea
