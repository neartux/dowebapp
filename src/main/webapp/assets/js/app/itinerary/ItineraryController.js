(function (){
    var app = angular.module('Itinerary', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'ItineraryProvider', 'CommonDirectives']).config(function (calendarConfig) {
        console.info("calendarConfig = ", calendarConfig);
    });

    app.controller('ItineraryController', function($scope, $timeout, moment, ItineraryService, calendarConfig) {
        var ctrl = this;
        ctrl.calendarView = 'month'; // View calendar in month
        ctrl.viewDate = moment().startOf('month').toDate(); // Date focus
        ctrl.cellIsOpen = true; // If date has events open

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

        var actions = [{
            label: '<i class=\'glyphicon glyphicon-pencil\'></i>',
            onClick: function(args) {
                alert('Edited', JSON.stringify(args.calendarEvent));
            }
        }, {
            label: '<i class=\'glyphicon glyphicon-remove\'></i>',
            onClick: function(args) {
                alert('Deleted', JSON.stringify(args.calendarEvent));
            }
        }];

        // TEST EVENTS
        ctrl.events = [
            {
                title: 'Increments the badge total on the day cell',
                color: calendarConfig.colorTypes.warning,
                startsAt: moment().startOf('month').toDate(),
                cssClass: 'my-custom-class', // Custom class
                incrementsBadgeTotal: true, // Increment an view bag
                draggable: true // If event can be draggable
            },
            {
                title: 'Does not increment the badge total ',
                color: calendarConfig.colorTypes.info,
                startsAt: moment().startOf('month').toDate(),
                incrementsBadgeTotal: false,
                actions: actions
            }
        ];

        /**
         * Method when specific number date is clicked to view day
         *
         * @param dateClicked Date clicked
         */
        ctrl.clickInDateToViewDay = function (dateClicked) {
            console.info("Date Clicked = ", dateClicked);
        };

        /**
         * Method when  is select a range in day view of calendar
         *
         * @param startDate Star date selected
         * @param endDate End date selected
         */
        ctrl.selectRangeInDayView = function(startDate, endDate) {
            console.info("startDate = ", startDate, " endate = ", endDate);
        };

    });

})();
