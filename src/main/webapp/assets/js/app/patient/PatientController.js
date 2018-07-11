(function (){
    var app = angular.module('Patient', ['PatientProvider']);

    app.controller('PatientController', function($scope, PatientService) {
        var ctrl = this;
        ctrl.patientList = { data: [] };

        /**
         * Init patient app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            PatientService.contextPath = contextPath;
            // Find all patients of the system
            ctrl.findAllPatients();
        };

        /**
         * Method to find all patient of the system
         */
        ctrl.findAllPatients = function () {
            PatientService.findAllPatients().then(function (res) {
                console.info("DATA = ", res);
                if(!res.data.data.error) {
                    ctrl.patientList.data = res.data.data;
                }
            });
        };

    });

})();
