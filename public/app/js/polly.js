var app = angular.module('pollyApp', []);

app.controller('phonesController', function($scope, $http) {
      
    $http.get('/brands').success(function(data) {
        $scope.brands = data.brands;
    });

    $scope.getModels = function () {
      $http.get('/models', { params: { brand: $scope.selectedBrand } }).success(function(data) {
         $scope.models = data.models;
      });
    };

    $scope.getDesc = function () {
      $http.get('/phones', { params: { phone_url: $scope.selectedModel.link } }).success(function(data) {
         $scope.description = data.desc;
      });
    };

});

app.controller('searchController', function($scope, $http) {
     
    $scope.searchItem = function () {
      $http.get('/search', { params: { item: $scope.searchedItem } }).success(function(data) {
         $scope.items = data.items;
      });
    };
});