(function (){
    var app = angular.module('Patient', ['PatientProvider']);

    app.controller('PatientController', function($scope, PatientService) {
        var ctrl = this;
        ctrl.patientData = { data: [] };
        ctrl.patientTO = {};
        ctrl.bloodTypeList = { data: [] };

        /**
         * Init patient app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            showNotification("success", "this is the mesage");
            // Asign path aplication
            PatientService.contextPath = contextPath;
            // Find all patients of the system
            ctrl.findAllPatients();
            // Find all type of blood
            ctrl.findBloodTypes();
        };

        /**
         * Method to find all patient of the system
         */
        ctrl.findAllPatients = function () {
            return PatientService.findAllPatients().then(function (res) {
                console.info("res.data.data = ", res.data.data);
                if(!res.data.data.error) {
                    ctrl.patientData.data = res.data.data;
                    ctrl.patientData.data.elementsByPage = res.data.data.elementsByPage+"";
                    console.info("ctrl.patientData.data = ", ctrl.patientData.data)
                }
            });
        };

        /**
         * Find all types of blood
         */
        ctrl.findBloodTypes = function() {

        };

        ctrl.validatePatient = function(isValidForm) {
            if(isValidForm) {
                // Validate birthdate
            }
        };

        /**
         *
         * Methods to data table
         *
         **/


        /**
         * Method to change elements by page to show
         *
         * @returns {PromiseLike<T> | Promise<T> | *}
         */
        ctrl.reloadDataByFilters = function () {
            return PatientService.findAllPatientsByFilters(ctrl.patientData.data).then(function (res) {
                if(!res.data.error) {
                    ctrl.patientData.data = res.data.data;
                    ctrl.patientData.data.elementsByPage = res.data.data.elementsByPage+"";
                }
            });
        };

        ctrl.goToPage = function(pageNumber, search) {
            // If the button is enabled
            if(search === undefined || search) {
                console.info("pageNumber = ", pageNumber);
                console.info("isPrevious = ", search);
                console.info("ctrl.patientData.data.currentPage = ", ctrl.patientData.data.currentPage);
                console.info("==============================================================================================");
                ctrl.patientData.data.currentPage = pageNumber;
                ctrl.reloadDataByFilters();
            }
        };

        /**
         * Get the number of the pages
         *
         * @returns {Array} Array numbers
         */
        ctrl.getRangeOfPages = function() {
            var numberButtons = [];
            var cont = 0;
            for(var i = ctrl.patientData.data.countPages; i <= ctrl.patientData.data.pagesLimit; i++) {
                numberButtons[cont] = i;
                cont ++;
            }
            return numberButtons;
        };

    });

})();
