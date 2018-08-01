(function (){
    var app = angular.module('DoctorsOffice', ['DoctorsOfficeProvider', 'CommonDirectives', 'datatables']);

    app.controller('DoctorsOfficeController', function($scope, $http, $compile, DoctorsOfficeService, DTOptionsBuilder, DTColumnBuilder) {
        var ctrl = this;
        ctrl.doctorsOfficeData = { data: [] };
        ctrl.doctorData = { data: [] };
        ctrl.doctorsOfficeTO = {};
        ctrl.dtInstance = {};
        ctrl.isCreateDoctorsOffice = true;

        /**
         * Init doctorsoffice app
         *
         * @param contextPath aplication path
         */
        ctrl.init = function (contextPath) {
            // Asign path aplication
            DoctorsOfficeService.contextPath = contextPath;
            // Find doctors
            ctrl.findDoctors();
        };

        /**
         * Find all doctors
         */
        ctrl.findDoctors = function() {
            return DoctorsOfficeService.findDoctors().then(function (res) {
                console.info("res.data = ", res.data);
                if(!res.data.error) {
                    ctrl.doctorData.data = res.data.data;
                }
            });
        };

        /**
         * Method to display form to create a new doctorsoffice
         */
        ctrl.viewToCreateNewDoctorsOffice = function() {
            $scope.doctorsOfficeForm.$setPristine();
            ctrl.isCreateDoctorsOffice = true;
            ctrl.doctorsOfficeTO = {};
            $("#doctorsOfficeDataForm").modal();
        };

        /**
         * Method to validate and save a doctorsoffice
         *
         * @param isValidForm if generic form is valid
         */
        ctrl.validateDoctorsOffice = function(isValidForm) {
            // If is valid form
            if(isValidForm) {
                // Create new doctorsoffice
                if(ctrl.isCreateDoctorsOffice) {
                    ctrl.createDoctorsOffice();
                }
                // Is update an existing doctorsoffice
                else {
                    ctrl.updateDoctorsOffice();
                }
            }
        };

        /**
         * Method to create a doctorsoffice
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.createDoctorsOffice = function() {
            return DoctorsOfficeService.createDoctorsOffice(ctrl.doctorsOfficeTO).then(function (res) {
                if(res.data.error) {
                    showNotification("error", "Error: " + res.data.message);
                } else {
                    showNotification("success", "Se ha creado el consultorio correctamente");
                    // Refresh data doctorsoffice list
                    ctrl.dtInstance.rerender();
                }
                $("#doctorsOfficeDataForm").modal("hide");
            });
        };

        /**
         * Method to display form to update a doctorsOffice
         *
         * @param index Index in the list
         */
        ctrl.viewToUpdateDoctorsOffice = function(index) {
            ctrl.isCreateDoctorsOffice = false;
            ctrl.doctorsOfficeTO = angular.copy(ctrl.doctorData.data[index]);
            ctrl.doctorsOfficeTO.doctorsOfficeIndex = index;
            $("#doctorsOfficeDataForm").modal();
        };

        /**
         * Method to update a doctorsoffice
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.updateDoctorsOffice = function() {
            return DoctorsOfficeService.updateDoctorsOffice(ctrl.doctorsOfficeTO).then(function (res) {
                if(res.data.error) {
                    showNotification("error", "Error: " + res.data.message);
                } else {
                    showNotification("success", "El consultorio se ha modificado correctamente");
                    // Update doctor information
                    ctrl.doctorsOfficeData.data.data[ctrl.doctorsOfficeTO.doctorsOfficeIndex] = angular.copy(ctrl.doctorsOfficeTO);
                }
                $("#doctorsOfficeDataForm").modal("hide");
            });
        };

        /**
         * Method to delete a doctorsOffice by id
         *
         * @returns {PromiseLike<T> | Promise<T> | *} Response
         */
        ctrl.deleteDoctorsOffice = function(id) {
            swal(getConfigurationSwalConfirm("Estas seguro?","Se eliminara el consultorio del sistema","warning","SI, eliminarlo!"), function (isConfirm) {
                if (isConfirm) {
                    return DoctorsOfficeService.deleteDoctorsOffice(id).then(function (res) {
                        if(res.data.error) {
                            showNotification("error", "Error: " + res.data.data.message);
                        } else {
                            showNotification("success", "El consultorio se ha eliminado");
                            // Refresh data doctor
                            ctrl.dtInstance.rerender();
                        }
                    });
                }
            });
        };


        /**
         ********************************************************
         * Methods to data table
         ********************************************************
         **/


        /**
         * Override some fields of doctorsoffice table
         * @param row The row
         * @param data The element
         * @param dataIndex The index
         */
        function createdRow(row, data, dataIndex) {
            $(row.getElementsByTagName("TD")[0]).html(dataIndex + 1);
            $(row.getElementsByTagName("TD")[2]).html('<h5 class="m-0">'+ data.firstName + ' ' + data.lastName +'</h5>');

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
                DoctorsOfficeService.findAllDoctorsOffice(data).then(function (res) {
                    if(!res.data.error) {
                        fnCallback(res.data.data);
                        ctrl.doctorsOfficeData.data = res.data.data;
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
                info: "Mostrando del _START_ al _END_ de _TOTAL_ consultorios",
                infoEmpty: "No se encontraron consultorios.",
                infoFiltered: "(filtrado _MAX_ elementos total)",
                infoPostFix: "",
                loadingRecords: "Cargando consultorios...",
                zeroRecords: "No se encontraron consultorios",
                emptyTable: "No hay consultorios disponibles",
                paginate: {
                    first: "Primero",
                    previous: "Anterior",
                    next: "Siguiente",
                    last: "Último"
                }
            }
        };

        ctrl.dtColumns = [
            DTColumnBuilder.newColumn(null).withTitle('#').withClass('text-center').withOption('width', '10%').notSortable(),
            DTColumnBuilder.newColumn('description').withTitle('Descripción').withClass('text-left').withOption('width', '30%').notSortable(),
            DTColumnBuilder.newColumn('doctor').withTitle('Médico').withClass('text-left').withOption('width', '30%').notSortable(),
            DTColumnBuilder.newColumn(null).withTitle('Panel').withClass('text-right').withOption('width', '30%').renderWith(panelActions).notSortable()
        ];

        /**
         * Create icons to panel actions
         * @param data Row
         * @param type type
         * @param full
         * @param meta
         * @returns {string} Html string to panel actions
         */
        function panelActions(data, type, full, meta) {
            return '<button class="btn btn-icon waves-effect btn-primary" title="Editar" data-ng-click="ctrl.viewToUpdateDoctorsOffice(' + meta.row + ')"> ' +
                '<i class="mdi mdi-pencil-box-outline"></i> </button>' +
                '<button class="btn btn-icon waves-effect btn-danger" title="Eliminar" data-ng-click="ctrl.deleteDoctorsOffice(' + full.id+ ')"> ' +
                '<i class="ti-trash"></i> </button>';
        }

    });

})();
