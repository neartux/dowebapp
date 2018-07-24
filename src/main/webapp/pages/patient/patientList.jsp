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
        <link href="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.css" rel="stylesheet" type="text/css"/>

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

                        <div class="panel panel-color panel-primary">
                            <div class="panel-heading">
                                <div class="col-sm-6 p-l-0">
                                    <h3 class="panel-title">Pacientes</h3>
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
                                    <div class="col-sm-12">
                                        <table dt-options="ctrl.dtOptions" dt-columns="ctrl.dtColumns" dt-instance="ctrl.dtInstance" datatable=""
                                               class="table table-striped table-colored table-info dataTable no-footer">
                                            <thead>
                                            <tr>
                                                <th class="text-uppercase bold"></th>
                                                <th class="text-uppercase bold"></th>
                                                <th class="text-uppercase bold"></th>
                                                <th class="text-uppercase bold"></th>
                                                <th class="text-uppercase bold"></th>
                                            </tr>
                                            </thead>
                                        </table>
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
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientController.js?1.1"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {

                $('#datatable').dataTable();

                $('#field-birthDate').datepicker({
                    autoclose: true,
                    todayHighlight: true,
                    format: 'dd/mm/yyyy'
                });
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>