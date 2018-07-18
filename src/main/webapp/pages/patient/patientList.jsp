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
                            <h4 class="page-title">DO </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li>
                                    <a href="#">Patient </a>
                                </li>
                                <li class="active">
                                    Patient List
                                </li>
                            </ol>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-sm-12">

                        <div class="portlet">
                            <div class="portlet-heading bg-primary">
                                <h3 class="portlet-title">
                                    Patient List
                                </h3>
                                <div class="portlet-widgets">
                                </div>
                                <div class="clearfix"></div>
                            </div>
                            <div id="bg-primary" class="panel-collapse collapse in">
                                <div class="portlet-body">

                                    <div class="row">
                                        <div class="col-sm-6 text-left form-horizontal">
                                            <div class="form-group">
                                                <label for="numElement" class="col-sm-1 control-label">Show</label>
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
                                                <label for="searchFilter" class="col-sm-3 control-label">Search</label>
                                                <div class="col-sm-9">
                                                    <input type="text" data-ng-model="ctrl.patientData.data.q"
                                                           class="form-control" id="searchFilter">
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="row">

                                        <div class="col-md-12">

                                            <div class="col-lg-3 col-md-3" data-ng-repeat="patient in ctrl.patientData.data.data">
                                                <div class="text-center card-box">
                                                    <div class="member-card">
                                                        <div class="thumb-xl member-thumb m-b-10 center-block">
                                                            <img src="${pageContext.request.contextPath}/assets/images/users/avatar-1.jpg" class="img-circle img-thumbnail" alt="profile-image">
                                                            <i class="mdi mdi-star-circle member-star text-success" title="verified user"></i>
                                                        </div>

                                                        <div class="">
                                                            <h4 class="m-b-5">{{ patient.firstName }}</h4>
                                                            <p class="text-muted">{{ patient.email }}</p>
                                                        </div>

                                                        <button type="button" class="btn btn-success btn-sm w-sm waves-effect m-t-10 waves-light">  <i class="ti-pencil-alt"></i> Edit</button>
                                                        <button type="button" class="btn btn-danger btn-sm w-sm waves-effect m-t-10 waves-light"> <i class="ti-trash"></i> Delete</button>

                                                        <hr/>

                                                        <div class="text-left">
                                                            <p class="text-muted font-13"><strong>Full Name :</strong> <span class="m-l-15">{{ patient.firstName }}</span></p>

                                                            <p class="text-muted font-13"><strong>Phone :</strong><span class="m-l-15">{{ patient.phone }}</span></p>

                                                            <p class="text-muted font-13"><strong>Mobile :</strong><span class="m-l-15">{{ patient.cellPhone }}</span></p>

                                                            <p class="text-muted font-13"><strong>Email :</strong> <span class="m-l-15">{{ patient.email }}</span></p>

                                                            <p class="text-muted font-13"><strong>Location :</strong> <span class="m-l-15">{{ patient.address }}</span></p>
                                                        </div>

                                                    </div>

                                                </div> <!-- end card-box -->

                                            </div> <!-- end col -->

                                        </div>

                                    </div>

                                    <div class="row">
                                        <div class="col-sm-6 text-left m-t-30">
                                            Showing {{ ctrl.patientData.data.start }} to {{ ctrl.patientData.data.end }} of {{ ctrl.patientData.data.length }} entries
                                        </div>
                                        <div class="col-sm-6 text-right">

                                            <ul class="pagination">
                                                <!-- If exist before pages to return previous page -->
                                                <li data-ng-class="!ctrl.patientData.data.existMorePagesBefore ? 'disabled' : ''">
                                                    <a class="waves-effect" data-ng-click="ctrl.goToPage(ctrl.patientData.data.currentPage - 1, ctrl.patientData.data.existMorePagesBefore);">
                                                        <i class="fa fa-angle-left"></i>
                                                        Previous
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
                                                        Next <i class="fa fa-angle-right"></i>
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
        <script>

            $(function () {
                $('#field-birthDate').datepicker({
                    autoclose: true,
                    todayHighlight: true
                });
                $("#patientDataForm").modal();
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>