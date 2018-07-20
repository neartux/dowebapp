<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <link href="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <div class="content" data-ng-app="Patient" data-ng-controller="PatientController as ctrl" data-ng-init="ctrl.init('${pageContext.request.contextPath}');">
            <div class="container">


                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Lista de Pacientes </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">Paciente </a>
                                </li>
                                <li class="active">
                                    Lista de Pacientes
                                </li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">

                        <div class="panel panel-border panel-primary">
                            <div class="panel-heading">
                                <div class="col-sm-6 p-l-0">
                                    <h3 class="panel-title"></h3>
                                </div>
                                <div class="col-sm-6 text-right p-r-0">
                                    <button type="button" data-ng-click="ctrl.viewToCreateNewPatient();"
                                            class="btn btn-default btn-rounded w-md waves-effect btn-sm">
                                        <i class="mdi mdi-account-plus"></i> Nuevo Paciente
                                    </button>
                                </div>
                            </div>
                            <div class="panel-body">

                                <div class="row m-t-50">
                                    <div class="col-sm-6 text-left form-horizontal">
                                        <div class="form-group">
                                            <label for="numElement" class="col-sm-1 control-label">Mostrar</label>
                                            <div class="col-sm-3">
                                                <select data-ng-model="ctrl.patientData.data.elementsByPage" data-ng-change="ctrl.reloadDataByFilters();"
                                                        class="form-control" id="numElement">
                                                    <option value="10">10</option>
                                                    <option value="15">15</option>
                                                    <option value="25">25</option>
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-sm-6 pull-right form-horizontal">
                                        <div class="form-group pull-right">
                                            <label for="searchFilter" class="col-sm-3 control-label">Buscar Paciente</label>
                                            <div class="col-sm-9">
                                                <input type="text" data-ng-model="ctrl.patientData.data.q"
                                                       class="form-control" id="searchFilter">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="row">

                                    <div class="col-md-12">

                                        <div class="col-lg-3 col-md-3 m-t-20" data-ng-repeat="patient in ctrl.patientData.data.data">
                                            <div class="text-center card-box">
                                                <div class="member-card">
                                                    <div class="thumb-xl member-thumb m-b-10 center-block">
                                                        <img src="${pageContext.request.contextPath}/assets/images/users/avatar-1.jpg" class="img-circle img-thumbnail" alt="profile-image">
                                                        <i class="mdi mdi-star-circle member-star text-success" title="verified user"></i>
                                                    </div>

                                                    <div class="">
                                                        <h4 class="m-b-5">{{ patient.firstName }} {{ patient.lastName }}</h4>
                                                        <!--<p class="text-muted">{{ patient.email }}</p>-->
                                                    </div>

                                                    <button type="button" data-ng-click="ctrl.viewToUpdatePatient(patient);"
                                                            class="btn btn-success btn-sm w-sm waves-effect m-t-10 waves-light">
                                                        <i class="ti-pencil-alt"></i> Actualizar
                                                    </button>
                                                    <button type="button" data-ng-click="ctrl.deletePatient(patient.id);"
                                                            class="btn btn-danger btn-sm w-sm waves-effect m-t-10 waves-light">
                                                        <i class="ti-trash"></i> Eliminar
                                                    </button>

                                                    <hr/>

                                                    <div class="text-left">
                                                        <p class="text-muted font-13"><strong>Celular :</strong><span class="m-l-15">{{ patient.cellPhone }}</span></p>

                                                        <p class="text-muted font-13"><strong>Email :</strong> <span class="m-l-15">{{ patient.email }}</span></p>

                                                        <p class="text-muted font-13"><strong>Direcci&oacute;n :</strong> <span class="m-l-15">{{ patient.address }}</span></p>
                                                    </div>

                                                </div>

                                            </div> <!-- end card-box -->

                                        </div> <!-- end col -->

                                    </div>

                                </div>

                                <div class="row">
                                    <div class="col-sm-6 text-left m-t-30">
                                        Mostrando {{ ctrl.patientData.data.start }} a {{ ctrl.patientData.data.end }} de {{ ctrl.patientData.data.length }} elementos
                                    </div>
                                    <div class="col-sm-6 text-right">

                                        <ul class="pagination">
                                            <!-- If exist before pages to return previous page -->
                                            <li data-ng-class="!ctrl.patientData.data.existMorePagesBefore ? 'disabled' : ''">
                                                <a class="waves-effect" data-ng-click="ctrl.goToPage(ctrl.patientData.data.currentPage - 1, ctrl.patientData.data.existMorePagesBefore);">
                                                    <i class="fa fa-angle-left"></i>
                                                    Anterior
                                                </a>
                                            </li>
                                            <!-- If exist before pages to return page 1 -->
                                            <li data-ng-class="!ctrl.patientData.data.existMorePagesBefore ? 'disabled' : ''">
                                                <a data-ng-click="ctrl.goToPage(1, ctrl.patientData.data.existMorePagesBefore);">
                                                    <i class="fa fa-angle-left"></i>
                                                </a>
                                            </li>


                                            <li data-ng-repeat="pageNumber in ctrl.getRangeOfPages() track by $index"
                                                data-ng-class="pageNumber == ctrl.patientData.data.currentPage ? 'active' : ''">
                                                <a data-ng-click="ctrl.goToPage(pageNumber);">
                                                    {{ pageNumber }}
                                                </a>
                                            </li>


                                            <!-- If exist more pages to go last page -->
                                            <li data-ng-class="!ctrl.patientData.data.existMorePagesAfter ? 'disabled' : ''">
                                                <a data-ng-click="ctrl.goToPage(ctrl.patientData.data.numPages, ctrl.patientData.data.existMorePagesAfter);">
                                                    <i class="fa fa-angle-right"></i>
                                                </a>
                                            </li>
                                            <!-- If exist more page to go to next -->
                                            <li data-ng-class="!ctrl.patientData.data.existMorePagesAfter ? 'disabled' : ''">
                                                <a class="waves-effect" data-ng-click="ctrl.goToPage(ctrl.patientData.data.currentPage + 1, ctrl.patientData.data.existMorePagesAfter);">
                                                    Siguiente <i class="fa fa-angle-right"></i>
                                                </a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                </div>

            </div>

            <jsp:include page="patientForm.jsp" />

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientController.js?1.1"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {
                $('#field-birthDate').datepicker({
                    autoclose: true,
                    todayHighlight: true,
                    format: 'dd/mm/yyyy'
                });
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>