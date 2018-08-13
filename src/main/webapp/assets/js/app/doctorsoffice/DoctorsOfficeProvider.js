(function () {
    var app = angular.module('DoctorsOfficeProvider', []);

    app.factory('DoctorsOfficeService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllDoctorsOffice = function (data) {
            return $http({ method: 'POST', url: service.contextPath + '/doctorsoffice', data: data,
                headers: {
                    'Content-type': 'application/json'
                }
            });
        };

        service.findDoctors = function () {
            return $http.get(service.contextPath + '/doctorsoffice/findDoctors')
        };

        service.createDoctorsOffice = function (doctorsOfficeTO) {
            return $http.post(service.contextPath + '/doctorsoffice/create', doctorsOfficeTO);
        };

        service.updateDoctorsOffice = function (doctorsOfficeTO) {
            return $http.put(service.contextPath + '/doctorsoffice/update', doctorsOfficeTO);
        };

        service.deleteDoctorsOffice = function (doctorsOfficeId) {
            return $http.delete(service.contextPath + '/doctorsoffice/delete', {params: {doctorsOfficeId: doctorsOfficeId}});
        };

        return service;

    });

})();