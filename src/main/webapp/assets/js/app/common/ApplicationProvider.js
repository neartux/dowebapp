(function () {
    var app = angular.module('ApplicationProvider', []);

    app.factory('ApplicationService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        return service;

    });

})();