'use strict';


// Declare app level module which depends on filters, and services
angular.module('myApp', [
  'ngRoute','ngResource','ngTouch',
  'myApp.filters',
  'myApp.services',
  'myApp.directives',
  'myApp.controllers'
]).
config(['$routeProvider', function($routeProvider) {
  $routeProvider.when('/home', {templateUrl: 'partials/home.html', controller: 'mainCtrl'});
  $routeProvider.when('/staff', {templateUrl: 'partials/staff.html', controller: 'persCtrl'});
  $routeProvider.when('/reports', {templateUrl: 'partials/reports.html?type=fi', controller: 'rptCtrl'});
  $routeProvider.when('/about', {templateUrl: 'partials/about.html', controller: 'mainCtrl'});
  $routeProvider.otherwise({redirectTo: '/home'})
}]);
