(function () {
    var app = angular.module('DoctorProvider', []);

    app.factory('DoctorService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findAllDoctors = function (data) {
            return $http({ method: 'POST', url: service.contextPath + '/doctor', data: data,
                headers: {
                    'Content-type': 'application/json'
                }
            });
        };

        service.existUserByUserName = function (userName) {
            return $http.get(service.contextPath + '/doctor/existusername/' + userName);
        };

        service.createDoctor = function (doctorTO) {
            return $http.post(service.contextPath + '/doctor/create', doctorTO);
        };

        service.updateDoctor = function (doctorTO) {
            return $http.put(service.contextPath + '/doctor/update', doctorTO);
        };

        service.deleteDoctor = function (doctorId) {
            return $http.delete(service.contextPath + '/doctor/delete', {params: {doctorId: doctorId}});
        };

        service.updoadProfilePictureDoctor = function (formData) {
            return $http.post(service.contextPath + "/doctor/updoadDoctorProfile", formData, {
                transformRequest: angular.identity,
                headers: {
                    'Content-Type': undefined
                }
            });
        };

        return service;

    });

})();