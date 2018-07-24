(function (){
    var app = angular.module('Patient', ['PatientProvider', 'CommonDirectives', 'datatables']);

    app.controller('PatientController', function($scope, $http, $compile, PatientService, DTOptionsBuilder, DTColumnBuilder) {
        var ctrl = this;
        ctrl.patientData = { data: [] };
        ctrl.patientTO = {};
        ctrl.bloodTypeList = { data: [] };
        ctrl.isCreatePatient = true;
        ctrl.dtInstance = {};

        /**
         * Init patient app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            PatientService.contextPath = contextPath;
            // Find all type of blood
            ctrl.findBloodTypes();
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
            //patientForm.setPristine();
            $scope.patientForm.$setPristine();
            ctrl.isCreatePatient = true;
            ctrl.patientTO = {};
            $("#patientDataForm").modal();
            PatientService.setMenuPatient();
            console.info("END");
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
                        ctrl.updatePatient();
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
                    // Refresh data patient
                    ctrl.dtInstance.rerender();
                }
                $("#patientDataForm").modal("hide");
            });
        };

        /**
         * Method to display form to update a patient
         *
         * @param index index in the list
         * @param patient Patient to update
         */
        ctrl.viewToUpdatePatient = function(index, patient) {
            ctrl.isCreatePatient = false;
            ctrl.patientTO = angular.copy(patient);
            ctrl.patientTO.indexElement = index;
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
            ctrl.patientTO.birthDate = null;
            return PatientService.updatePatient(ctrl.patientTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "El paciente se ha modificado correctament");
                    // Update patient information
                    ctrl.patientData.data.data[ctrl.patientTO.indexElement] = angular.copy(ctrl.patientTO);
                }
                $("#patientDataForm").modal("hide");
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
                        if(res.data.error) {
                            showNotification("error", "Error: " + res.data.data.message);
                        } else {
                            showNotification("success", "El paciente se ha eliminado");
                            // Refresh data patient
                            ctrl.dtInstance.rerender();
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
         * Override some fields of patients table
         * @param row The row
         * @param data The element
         * @param dataIndex The index
         */
        function createdRow(row, data, dataIndex) {
            var profilePicture = PatientService.contextPath + "/assets/images/users/no-avatar.png";
            // Verify if patient has profile picture
            if (isValidField(data.profileImage)) {
                profilePicture = data.profileImage;
            }
            $(row.getElementsByTagName("TD")[0]).html('<img src="'+profilePicture+'" alt="'+data.firstName+' ' + data.lastName + '" class="thumb-sm img-circle" />');
            $(row.getElementsByTagName("TD")[1]).html('<h5 class="m-0">'+ data.firstName + ' ' + data.lastName +'</h5><p class="m-0 text-muted font-13"><i class="mdi mdi-book"></i><small>Expediente: '+ data.expedient +'</small></p>');

            // Recompiling so we can bind Angular directive to the DT
            $compile(angular.element(row).contents())($scope);
        }

        ctrl.dtOptions = {
            DOM: 'lfrtip',
            displayLength: 10,
            processing: true,
            serverSide: true,
            dataProp: 'data',
            paginationType: 'full_numbers',
            fnServerData: function (sSource, aoData, fnCallback, oSettings) {
                var data = {
                    start: aoData[3].value,
                    length: aoData[4].value,
                    draw: aoData[0].value,
                    order: aoData[2].value,
                    search: aoData[5].value,
                    columns: aoData[1].value
                };
                PatientService.findAllPatients(data).then(function (res) {
                    if(!res.data.error) {
                        fnCallback(res.data.data);
                        ctrl.patientData.data = res.data.data;
                    }
                });
            },
            fnServerParams: function (aoData) {
            },
            createdRow: createdRow,
            paginate: true,
            pagining: true,
            paging: true,
            language: {
                processing: "Procesando...",
                search: "Buscar:",
                lengthMenu: "Mostrar _MENU_ Elementos",
                info: "Mostrando del _START_ al _END_ de _TOTAL_ pacientes",
                infoEmpty: "No se encontraron pacientes.",
                infoFiltered: "(filtrado _MAX_ elementos total)",
                infoPostFix: "",
                loadingRecords: "Cargando pacientes...",
                zeroRecords: "No se encontraron pacientes",
                emptyTable: "No hay pacientes disponibles",
                paginate: {
                    first: "Primero",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Último"
                }
            }
        };

        ctrl.dtColumns = [
            DTColumnBuilder.newColumn(null).withTitle('').withClass('text-center').withOption('width', '15%').notSortable(),
            DTColumnBuilder.newColumn(null).withTitle('Paciente').withClass('text-left').withOption('width', '40%').notSortable(),
            DTColumnBuilder.newColumn('address').withTitle('Direccion').withClass('text-left').withOption('width', '10%').notSortable(),
            DTColumnBuilder.newColumn('cellPhone').withTitle('Celular').withClass('text-right').withOption('width', '10%').notSortable(),
            DTColumnBuilder.newColumn('phone').withTitle('Telefono').withClass('text-right').withOption('width', '10%').notSortable()
        ];

    });

})();
