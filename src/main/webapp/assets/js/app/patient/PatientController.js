(function (){
    var app = angular.module('Patient', ['PatientProvider', 'CommonDirectives']);

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
                if(!res.data.error) {
                    ctrl.patientData.data = res.data.data;
                    ctrl.patientData.data.elementsByPage = res.data.data.elementsByPage+"";
                }
            });
        };

        /**
         * Find all types of blood
         */
        ctrl.findBloodTypes = function() {
            return PatientService.findBloodTypes().then(function (res) {
                if(!res.data.error) {
                    ctrl.bloodTypeList.data = res.data.data;
                }
            });
        };

        /**
         * Method to display form to create a new patient
         */
        ctrl.viewToCreateNewPatient = function() {
            ctrl.isCreatePatient = true;
            ctrl.patientTO = {};
            $("#patientDataForm").modal();
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
                        console.info("Go to create patient");
                        ctrl.createPatient();
                    }
                    // Is update an existing patient
                    else {

                    }
                }
            }
        };

        /**
         * Method to create a patient
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.createPatient = function() {
            return PatientService.createPatient(ctrl.patientTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "El paciente se ha creado");
                }
                $("#patientDataForm").modal("hide");
            });
        };

        /**
         * Method to display form to update a patient
         * @param patient
         */
        ctrl.viewToUpdatePatient = function(patient) {
            ctrl.patientTO = angular.copy(patient);
            ctrl.patientTO.bloodTypeId = patient.bloodTypeId.toString();
            $('#field-birthDate').datepicker('update', moment(ctrl.patientTO.birthDate).format('DD/MM/YYYY'));
            $("#patientDataForm").modal();
        };

        /**
         * Method to update a patient
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.updatePatient = function() {
            return PatientService.updatePatient(ctrl.patientTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "El paciente se ha modificado correctament");
                }
            });
        };

        /**
         * Method to delete a patient
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.deletePatient = function(id) {
            swal(getConfigurationSwalConfirm("Estas seguro?","Se eliminara el paciente del sistema","warning","SI, eliminarlo!"), function (isConfirm) {
                if (isConfirm) {
                    return PatientService.deletePatient(id).then(function (res) {
                        if(res.data.data.error) {
                            showNotification("error", "Error: " + res.data.data.message);
                        } else {
                            showNotification("success", "El paciente se ha eliminado");
                        }
                    });
                }
            });
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
            // Validate if date exist
            if (!$.trim(birthDate).length) {
                showNotification("warning", "La fecha de nacimiento es requerido");
                isValid = false;
            }
            // if exist set date in model
            else {
                ctrl.patientTO.birthDateS = birthDate;
            }
            return isValid;
        };

        /**
         * Method to valid and upload a profile picture of a patient
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.validateAndUploadProfilPicturePatient = function() {
            // Get profile picture
            var profilePicture = $("#profilePicturePatient")[0].files[0];
            // Validate profile picture
            if (profilePicture === undefined) {
                showNotification("warning", "Selecciona una imagen de perfil");
                return;
            }
            // Build request
            var formData = new FormData();
            formData.append("file", profilePicture);
            formData.append("patientId", ctrl.patientTO.id);
            // Send request
            return PatientService.updoadProfilePicturePatient(formData).then(function (res) {
                console.info("response data = ", res);
            });
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
