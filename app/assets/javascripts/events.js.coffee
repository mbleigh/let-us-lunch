app = angular.module 'lunchApp', []

app.controller 'EventFormCtrl', ($scope)->
  $scope.size = 1
  $scope.emails = [""]
    
app.directive 'placeComplete', ->
  require: 'ngModel'
  link: (scope, element, attrs, model)->
    options =
      componentRestrictions: {country: 'us'}
      
    scope.gPlace = new google.maps.places.Autocomplete(element[0], options)

    google.maps.event.addListener scope.gPlace, 'place_changed', ->
      scope.$apply ->
      model.$setViewValue element.val()