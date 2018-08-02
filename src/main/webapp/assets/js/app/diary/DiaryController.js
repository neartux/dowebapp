(function (){
    var app = angular.module('Diary', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'DiaryProvider', 'CommonDirectives']).config(function (calendarConfig) {
        console.info("calendarConfig = ", calendarConfig);
    });

    app.controller('DiaryController', function($scope, $timeout, moment, DiaryService) {
        var ctrl = this;
        ctrl.calendarView = 'month';

        /**
         * Init diary app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            DiaryService.contextPath = contextPath;
        };

    });

})();
