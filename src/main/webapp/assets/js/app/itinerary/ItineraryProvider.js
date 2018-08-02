(function () {
    var app = angular.module('ItineraryProvider', []);

    app.factory('ItineraryService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        return service;

    });

})();