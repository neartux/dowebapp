(function (){
    var app = angular.module('Patient', ['PatientProvider']);

    app.directive('iCheck', function () {
        return {
            require: 'ngModel',
            link: function ($scope, element, $attrs, ngModel) {
                var value;
                value = $attrs['value'];
                var color = $attrs.color;
                var skin = $attrs.skin;

                skin = skin && color ? skin + '-' + color : skin;

                $scope.$watch($attrs['ngModel'], function (newValue) {
                    $(element).iCheck('update');
                });

                $scope.$watch($attrs['ngDisabled'], function (newValue) {
                    $(element).iCheck(newValue ? 'disable' : 'enable');
                    $(element).iCheck('update');
                });

                return $(element).iCheck({
                    checkboxClass: skin ? 'icheckbox_' + skin : 'icheckbox_minimal',
                    radioClass: skin ? 'iradio_' + skin : 'iradio_minimal',
                    increaseArea: '20%'
                }).on('ifChanged', function (event) {
                    if ($(element).attr('type') === 'checkbox' && $attrs['ngModel']) {
                        $scope.$apply(function () {
                            return ngModel.$setViewValue(event.target.checked);
                        })
                    }
                }).on('ifClicked', function (event) {
                    if ($(element).attr('type') === 'radio' && $attrs['ngModel']) {
                        return $scope.$apply(function () {
                            //set up for radio buttons to be de-selectable
                            if (ngModel.$viewValue !== value)
                                return ngModel.$setViewValue(value);
                            else
                                ngModel.$setViewValue(null);
                            ngModel.$render();
                            return;
                        });
                    }
                });
            }
        }
    });

    app.controller('PatientController', function($scope, PatientService) {
        var ctrl = this;
        ctrl.patientData = { data: [] };
        ctrl.patientTO = {};
        ctrl.bloodTypeList = { data: [] };
        ctrl.isCreatePatient = true;

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
            return PatientService.findBloodTypes().then(function (res) {
                console.info("RES = ", res.data);
                if(!res.data.error) {
                    ctrl.bloodTypeList.data = res.data;
                }
            });
        };

        /**
         * Method to validate and save a new patient or update
         *
         * @param isValidForm if generic form is valid
         */
        ctrl.validatePatient = function(isValidForm) {
            // If is valid form
            if(isValidForm) {
                var isValid = ctrl.validatePatientForm();
                console.info("valid values form patient = ", isValid);
                // If is valid values form
                if(isValid) {
                    // Create new patient
                    if(ctrl.isCreatePatient) {

                    }
                    // Is update an existing patient
                    else {

                    }
                }
            }
        };

        /**
         * Method to valid form patient
         *
         * @returns {boolean} Return true if is valid, false the other way
         */
        ctrl.validatePatientForm = function() {
            var isValid = true;
            // Validate birthdate
            var birthDate = $("#field-birthDate").val();
            console.info("birthDate = ", birthDate);
            if (!$.trim(birthDate).length) {
                showNotification("warning", "La fecha de nacimiento es requerido");
                isValid = false;
            }
            return isValid;
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
