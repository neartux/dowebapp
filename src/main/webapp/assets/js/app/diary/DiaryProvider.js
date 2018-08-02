(function () {
    var app = angular.module('DiaryProvider', []);

    app.factory('DiaryService', function ($http, $q) {
        var service = {};

        service.contextPath = '';

        return service;

    });

})();