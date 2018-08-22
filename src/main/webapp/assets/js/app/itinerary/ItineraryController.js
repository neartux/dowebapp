(function (){
    var app = angular.module('Itinerary', ['mwl.calendar', 'ngAnimate', 'ui.bootstrap', 'ItineraryProvider', 'CommonDirectives']).config(function (calendarConfig) {
        console.info("calendarConfig = ", calendarConfig);
        calendarConfig.showTimesOnWeekView = true;
    });

    app.controller('ItineraryController', function($scope, $timeout, moment, ItineraryService, calendarConfig) {
        var ctrl = this;
        console.info("moment().startOf('month').toDate(); = ", moment().startOf('month').toDate());
        ctrl.calendarView = 'month'; // View calendar in month
        ctrl.viewDate = new Date(); // Date focus
        ctrl.cellIsOpen = true; // If date has events open
        ctrl.doctorOfficesData = { data: [] };
        ctrl.minutsDate = { data: NUMBER_ZERO };
        ctrl.years = { data: getArrayYears() };
        ctrl.months = { data: getArrayMonths() };
        ctrl.itineraryData = { data: {} };

        /**
         * Init Itinerary app
         *
         * @param contextPath aplication path
         * @param pattern Pattern app
         * @param minutsDate
         */
        ctrl.init = function (contextPath, pattern, minutsDate) {
            // Asign path aplication
            ItineraryService.contextPath = contextPath;
            // Find all doctors by company to select one.
            ctrl.findDoctorsOffices();
            // Tiempo entre consultas
            ctrl.minutsDate.data3 = minutsDate;
            console.info("ctrl.years = ", ctrl.years);
            console.info("ctrl.months = ", ctrl.months);
        };

        /**
         * Find all doctors
         */
        ctrl.findDoctorsOffices = function() {
            return ItineraryService.findDoctorsOfficces().then(function (res) {
                console.info("res.data = ", res.data);
                if(!res.data.error) {
                    ctrl.doctorOfficesData.data = res.data.data;
                }
            });
        };

        ctrl.findItineraryByOffice = function () {
            console.info("ctrl.itineraryData.data = ", ctrl.itineraryData.data);
            return ItineraryService.findItineraryByOffice(ctrl.itineraryData.data.officeId, ctrl.itineraryData.data.year, ctrl.itineraryData.data.month).then(function (res) {
                console.info("RES :P = ", res.data);
            });
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
