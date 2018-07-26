(function () {
    var app = angular.module('PatientProvider', []);

    app.factory('PatientService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllPatients = function (data) {
            return $http({
                method: 'POST',
                url: service.contextPath + '/patient',
                data: data,
                headers: {
                    'Content-type': 'application/json'
                }
            });
        };

        service.findBloodTypes = function () {
            return $http.get(service.contextPath + '/patient/findBloodTypes');
        };

        service.createPatient = function (patientTO) {
            return $http.post(service.contextPath + '/patient/create', patientTO);
        };

        service.updatePatient = function (patientTO) {
            return $http.post(service.contextPath + '/patient/update', patientTO);
        };

        service.deletePatient = function (patientId) {
            return $http.delete(service.contextPath + '/patient/delete', {params: {patientId: patientId}});
        };

        service.updoadProfilePicturePatient = function (formData) {
            return $http.post(service.contextPath + "/patient/updoadPacientProfile", formData, {
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined
                }
            });
        };

        return service;

    });

})();