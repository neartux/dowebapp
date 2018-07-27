(function (){
    var app = angular.module('Doctor', ['DoctorProvider', 'CommonDirectives', 'datatables']);

    app.controller('DoctorController', function($scope, $http, $compile, DoctorService, DTOptionsBuilder, DTColumnBuilder) {
        var ctrl = this;
        ctrl.doctorData = { data: [] };
        ctrl.doctorTO = {};
        ctrl.dtInstance = {};
        ctrl.isCreateDoctor = true;

        /**
         * Init doctor app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            DoctorService.contextPath = contextPath;
        };

        /**
         * Method to display form to create a new doctor
         */
        ctrl.viewToCreateNewDoctor = function() {
            $scope.doctorForm.$setPristine();
            ctrl.isCreateDoctor = true;
            ctrl.doctorTO = {};
            $("#doctorDataForm").modal();
        };

        /**
         * Method to validate and save a doctor
         *
         * @param isValidForm if generic form is valid
         */
        ctrl.validateDoctor = function(isValidForm) {
            // If is valid form
            if(isValidForm) {
                var isValid = ctrl.validateDoctorForm();
                // If is valid values form
                if(isValid) {
                    // Create new doctor
                    if(ctrl.isCreateDoctor) {
                        ctrl.createDoctor();
                    }
                    // Is update an existing doctor
                    else {
                        ctrl.updateDoctor();
                    }
                }
            }
        };

        /**
         * Method to create a doctor
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.createDoctor = function() {
            return DoctorService.createDoctor(ctrl.doctorTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "Se ha creado el doctor");
                    // Refresh data doctor
                    ctrl.dtInstance.rerender();
                }
                $("#doctorDataForm").modal("hide");
            });
        };

        /**
         * Method to display form to update a doctor
         *
         * @param index Index in the list
         * @param doctor Doctor to update
         */
        ctrl.viewToUpdateDoctor = function(index, doctor) {
            ctrl.isCreateDoctor = false;
            ctrl.doctorTO = angular.copy(doctor);
            ctrl.doctorTO.doctorIndex = index;
            $('#field-birthDate').datepicker('update', moment(ctrl.doctorTO.birthDate).format('DD/MM/YYYY'));
            $("#doctorDataForm").modal();
        };

        /**
         * Method to update a doctor
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.updateDoctor = function() {
            ctrl.doctorTO.birthDate = null;
            return DoctorService.updateDoctor(ctrl.doctorTO).then(function (res) {
                if(res.data.data.error) {
                    showNotification("error", "Error: " + res.data.data.message);
                } else {
                    showNotification("success", "El doctor se ha modificado correctamente");
                    // Update doctor information
                    ctrl.doctorData.data.data[ctrl.doctorTO.doctorIndex] = angular.copy(ctrl.doctorTO);
                }
                $("#doctorDataForm").modal("hide");
            });
        };

        /**
         * Method to delete a doctor
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.deleteDoctor = function(id) {
            swal(getConfigurationSwalConfirm("Estas seguro?","Se eliminara el doctor del sistema","warning","SI, eliminarlo!"), function (isConfirm) {
                if (isConfirm) {
                    return DoctorService.deleteDoctor(id).then(function (res) {
                        if(res.data.error) {
                            showNotification("error", "Error: " + res.data.data.message);
                        } else {
                            showNotification("success", "El doctor se ha eliminado");
                            // Refresh data doctor
                            ctrl.dtInstance.rerender();
                        }
                    });
                }
            });
        };

        /**
         * Method to valid form doctor
         *
         * @returns {boolean} Return true if is valid, false the other way
         */
        ctrl.validateDoctorForm = function() {
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
                ctrl.doctorTO.birthDateS = birthDate;
            }
            return isValid;
        };

        /**
         * Method to view modal to change profile picture
         */
        ctrl.viewChangeProfilePicture = function() {
            var input = $("#profilePictureDoctor");
            input.replaceWith(input.val('').clone(true));
            $("#modalUploadImage").modal();
        };

        /**
         * Method to valid and upload a profile picture of a doctor
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.validateAndUploadProfilPictureDoctor = function() {
            // Get profile picture
            var profilePicture = $("#profilePictureDoctor")[0].files[0];
            // Validate profile picture
            if (profilePicture === undefined) {
                showNotification("warning", "Selecciona una imagen de perfil");
                return;
            }
            // Build request
            var formData = new FormData();
            formData.append("file", profilePicture);
            formData.append("doctorId", ctrl.doctorTO.id);
            // Send request
            return DoctorService.updoadProfilePictureDoctor(formData).then(function (res) {
                console.info("response data = ", res);
                if(res.data.error) {
                    showNotification("error", "Error: " + res.data.message);
                } else {
                    ctrl.doctorTO.profileImage = res.data.data;
                    showNotification("success", "Se ha actualizado correctamente la foto de perfil");
                }
                $("#modalUploadImage").modal("hide");
            });
        };



        /**
         *
         * Methods to data table
         *
         **/


        /**
         * Override some fields of doctors table
         * @param row The row
         * @param data The element
         * @param dataIndex The index
         */
        function createdRow(row, data, dataIndex) {
            var profilePicture = "";
            // Verify if doctor has profile picture
            if (isValidField(data.profileImage)) {
                profilePicture = data.profileImage;
            }
            $(row.getElementsByTagName("TD")[0]).html('<img data-ng-click="ctrl.viewPadientData('+dataIndex+');" data-ng-src="'+ DoctorService.contextPath + '/doctor/getProfilePicture?url=' +profilePicture+'" alt="'+data.firstName+' ' + data.lastName + '" class="thumb-sm img-circle" />');
            $(row.getElementsByTagName("TD")[1]).html('<h5 class="m-0">'+ data.firstName + ' ' + data.lastName +'</h5><p class="m-0 text-muted font-13"><i class="mdi mdi-book"></i><small>Expediente: #'+ data.expedient +'</small></p>');

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
                DoctorService.findAllDoctors(data).then(function (res) {
                    if(!res.data.error) {
                        fnCallback(res.data.data);
                        ctrl.doctorData.data = res.data.data;
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
                info: "Mostrando del _START_ al _END_ de _TOTAL_ doctores",
                infoEmpty: "No se encontraron doctores.",
                infoFiltered: "(filtrado _MAX_ elementos total)",
                infoPostFix: "",
                loadingRecords: "Cargando doctores...",
                zeroRecords: "No se encontraron doctores",
                emptyTable: "No hay doctores disponibles",
                paginate: {
                    first: "Primero",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Último"
                }
            }
        };

        ctrl.dtColumns = [
            DTColumnBuilder.newColumn(null).withTitle('').withClass('text-center').withOption('width', '10%').notSortable(),
            DTColumnBuilder.newColumn(null).withTitle('Paciente').withClass('text-left').withOption('width', '35%').notSortable(),
            DTColumnBuilder.newColumn('address').withTitle('Direccion').withClass('text-left').withOption('width', '35%').notSortable(),
            DTColumnBuilder.newColumn('cellPhone').withTitle('Celular').withClass('text-right').withOption('width', '10%').notSortable(),
            DTColumnBuilder.newColumn('phone').withTitle('Telefono').withClass('text-right').withOption('width', '10%').notSortable()
        ];

    });

})();
