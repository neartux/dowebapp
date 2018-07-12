(function (){
    var app = angular.module('Patient', ['PatientProvider']);

    app.controller('PatientController', function($scope, PatientService) {
        var ctrl = this;
        ctrl.patientData = { data: [] };

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
                console.info("res.data.data = ", res.data.data);
                if(!res.data.data.error) {
                    ctrl.patientData.data = res.data.data;
                    console.info("HER");
                    console.info("ctrl.patientData.data = ", ctrl.patientData.data)
                }
            });
        };

    });

})();
