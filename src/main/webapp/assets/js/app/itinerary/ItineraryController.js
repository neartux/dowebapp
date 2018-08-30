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
        ctrl.itinerary = { data: {} };
        ctrl.itineraryTO = { data: {} };
        ctrl.eventTypes = { dateId: NUMBER_ZERO };

        /**
         * Init Itinerary app
         *
         * @param contextPath aplication path
         * @param pattern Pattern app
         * @param minutsDate Range
         * @param eventTypeDate Event type id
         */
        ctrl.init = function (contextPath, pattern, minutsDate, eventTypeDate) {
            // Asign path aplication
            ItineraryService.contextPath = contextPath;
            // Find all doctors by company to select one.
            ctrl.findDoctorsOffices();
            // Tiempo entre consultas
            ctrl.minutsDate.data3 = minutsDate;
            ctrl.eventTypes.dateId = eventTypeDate;
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
                ctrl.itinerary.data = res.data.data;
                var events = ctrl.setActionsItinerary(res.data.data.itineraryDetailTOList);
                console.info("rEADY TO SET = ", events);
                ctrl.itinerary.data.itineraryDetailTOList = events;
                console.info("termino");
            });
        };

        var actions = [{
            label: '<i class=\'mdi mdi-pencil-box-outline\'></i>',
            onClick: function(args) {
                alert('Edited', JSON.stringify(args.calendarEvent));
            }
        }, {
            label: '<i class=\'mdi mdi-calendar-remove\'></i>',
            onClick: function(args) {
                alert('Deleted', JSON.stringify(args.calendarEvent));
            }
        }];

        ctrl.setActionsItinerary = function (data) {

            angular.forEach(data, function (item, key) {
                console.info("ctrl.eventTypes.dateId = ", ctrl.eventTypes.dateId);
                console.info("item.eventTypeId = ", item.eventTypeId);
                if(parseInt(ctrl.eventTypes.dateId) === item.eventTypeId) {
                    event.color = calendarConfig.colorTypes.info;
                }
                item.actions = actions
            });
            return data;
        };

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
         * @param startsAt Star date selected
         * @param endsAt End date selected
         */
        ctrl.selectRangeInDayView = function(startsAt, endsAt) {
            ctrl.itineraryTO.data = {
                startsAt: startsAt,
                endsAt: endsAt,
                itineraryId: ctrl.itinerary.data.id,
                itineraryDate: ctrl.itinerary.data.itineraryDate,
                eventTypeId: ctrl.eventTypes.dateId,
                doctorOfficeId: ctrl.itineraryData.data.officeId
            };
            console.info("startDate = ", startsAt, " endate = ", endsAt);
            ctrl.saveItineraryByOffice();
        };

        ctrl.saveItineraryByOffice = function () {
            return ItineraryService.saveItineraryByOffice(ctrl.itineraryTO.data).then(function (res) {
                console.info("RES ============== ", res.data);
            });
        };

    });

})();
