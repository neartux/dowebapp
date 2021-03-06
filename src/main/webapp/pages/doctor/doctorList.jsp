<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <link href="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/css/bootstrap-datepicker.min.css"
              rel="stylesheet">
        <link href="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.css"
              rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.css"
              rel="stylesheet" type="text/css"/>

        <div class="content" data-ng-app="Doctor" data-ng-controller="DoctorController as ctrl"
             data-ng-init="ctrl.init('${pageContext.request.contextPath}');">

            <div class="container">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title"><spring:message code="doctor.label.list.title"/> </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#"><spring:message code="home.label.title"/></a>
                                </li>
                                <li class="active">
                                    <spring:message code="doctor.label.list.title"/>
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
                                <h3 class="panel-title"><i class="fa fa-user-md"></i> <spring:message code="doctor.label.list.doctors"/></h3>
                                <button type="button" data-ng-click="ctrl.viewToCreateNewDoctor();"
                                        class="btn btn-default btn-rounded w-md waves-effect btn-sm pull-right m-t-22">
                                    <i class="mdi mdi-account-plus"></i> <spring:message code="doctor.label.list.new.doctor"/>
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

            <!-- Modal, to create or update doctor data -->
            <jsp:include page="doctorForm.jsp"/>
            <!-- Information of doctor -->
            <jsp:include page="doctorView.jsp"/>
            <!-- Modal, to upload profile picture doctor -->
            <jsp:include page="uploadProfilePictureDoctor.jsp"/>

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/doctor/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/doctor/DoctorProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/doctor/DoctorController.js?1.1"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {

                $('#field-birthDate').datepicker({
                    autoclose: true,
                    todayHighlight: true,
                    format: 'dd/mm/yyyy'
                });

                $(":file").filestyle({input: false});

            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>