(function () {
    var app = angular.module('PatientProvider', []);

    app.factory('PatientService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllPatients = function () {
            return $http.get(service.contextPath + '/patient');
        };

        service.findAllPatientsByFilters = function (filters) {
            return $http.post(service.contextPath + '/patient', filters);
        };

        service.findBloodTypes = function () {
            return $http.get(service.contextPath + '/patient/findBloodTypes');
        };

        return service;

    });

})();