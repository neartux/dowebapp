<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <link href="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.css"
              rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.css"
              rel="stylesheet" type="text/css"/>

        <div class="content" data-ng-app="DoctorsOffice" data-ng-controller="DoctorsOfficeController as ctrl"
             data-ng-init="ctrl.init('${pageContext.request.contextPath}');">

            <div class="container">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Lista de M&eacute;dicos </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    Lista de Consultorios
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
                                <h3 class="panel-title"><i class="fa fa-hospital-o"></i> Consultorios</h3>
                                <button type="button" data-ng-click="ctrl.viewToCreateNewDoctor();"
                                        class="btn btn-default btn-rounded w-md waves-effect btn-sm pull-right m-t-22">
                                    <i class="mdi mdi-account-plus"></i> Nuevo Consultorio
                                </button>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-sm-12">
                                        <table dt-options="ctrl.dtOptions" dt-columns="ctrl.dtColumns"
                                               dt-instance="ctrl.dtInstance" datatable=""
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

            <!-- Modal, to create or update doctorsoffice data -->
            <jsp:include page="doctorsOfficeForm.jsp"/>

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/js/app/doctorsoffice/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/doctorsoffice/DoctorsOfficeProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/doctorsoffice/DoctorsOfficeController.js?1.2"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {

            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>