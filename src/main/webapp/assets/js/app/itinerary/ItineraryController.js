(function (){
    var app = angular.module('Itinerary', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'ItineraryProvider', 'CommonDirectives']).config(function (calendarConfig) {
        console.info("calendarConfig = ", calendarConfig);
    });

    app.controller('ItineraryController', function($scope, $timeout, moment, ItineraryService) {
        var ctrl = this;
        ctrl.calendarView = 'month';

        /**
         * Init Itinerary app
         *
         * @param contextPath aplication path
         * @param pattern Pattern app
         */
        ctrl.init = function (contextPath, pattern) {
            // Asign path aplication
            ItineraryService.contextPath = contextPath;
        };

    });

})();
