<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

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
                                                    <select data-ng-model="ctrl.patientData.data.elementsByPage" class="form-control" id="numElement">
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
                                            Showing 1 to 10 of {{ ctrl.patientData.data.length }} entries
                                        </div>
                                        <div class="col-sm-6 text-right">
                                            <ul class="pagination">
                                                <li>
                                                    <a href="#" class="waves-effect"><i class="fa fa-angle-left"></i> Previous</a>
                                                </li>
                                                <li class="disabled">
                                                    <a href="#"><i class="fa fa-angle-left"></i></a>
                                                </li>
                                                <li data-ng-repeat="page in [] | range:ctrl.patientData.data.pagesToDisplay"
                                                    class="active">
                                                    <a href="#">1</a>
                                                </li>
                                                <li>
                                                    <a href="#"><i class="fa fa-angle-right"></i></a>
                                                </li>
                                                <li>
                                                    <a href="#" class="waves-effect">Next <i class="fa fa-angle-right"></i></a>
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

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientController.js"></script>
        <script>

            $(function () {
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>