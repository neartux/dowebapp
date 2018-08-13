(function () {
    var app = angular.module('ItineraryProvider', []);

    app.factory('ItineraryService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        service.findDoctorsOfficces = function () {
            return $http.get(service.contextPath + '/itinerary/findDoctorsOfficces');
        };

        service.findItineraryByOffice = function (doctorOfficeId, month, year) {
            return $http.get(service.contextPath + '/itinerary/findItineraryByOffice/' + doctorOfficeId + '?month=' + month + '&year=' +year);
        };

        return service;

    });

})();