class MorrisLine
  constructor: () ->
    @restrict = 'EA'
    @scope =
      data: '=morrisLineData'
      options: '=morrisLineOptions'

  link: (scope, element) ->
    scope.$watch 'data', ->
      if scope.data
        if !scope.morrisLineInstance
          config = angular.copy scope.options
          config.element = element
          config.data = scope.data
          scope.morrisLineInstance = new Morris.Line config
        else
          scope.morrisLineInstance.setData scope.data

MorrisLine.$inject = ['$scope', '$element']

angular
  .module 'angular-morris'
  .directive 'morrisLine', -> new MorrisLine
