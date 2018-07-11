(function () {
    var app = angular.module('PatientProvider', []);

    app.factory('PatientService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllPatients = function () {
            return $http.get(service.contextPath + '/patient');
        };

        return service;

    });

})();