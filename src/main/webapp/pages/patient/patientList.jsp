<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <div class="content">
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
                        <div class="card-box">
                            <h4 class="m-t-0 header-title"><b>Patient List</b></h4>
                            <p class="text-muted m-b-30 font-13 text-right">
                                <span><i class="ti-layout-list-thumb fa-2x"></i></span>&nbsp;&nbsp;&nbsp;<span><i class="ti-layout-grid2 fa-2x"></i></span>
                            </p>
                            <div class="row">

                                <div class="col-md-12">

                                    <div class="col-lg-3 col-md-3">
                                        <div class="text-center card-box">
                                            <div class="member-card">
                                                <div class="thumb-xl member-thumb m-b-10 center-block">
                                                    <img src="${pageContext.request.contextPath}/assets/images/users/avatar-1.jpg" class="img-circle img-thumbnail" alt="profile-image">
                                                    <i class="mdi mdi-star-circle member-star text-success" title="verified user"></i>
                                                </div>

                                                <div class="">
                                                    <h4 class="m-b-5">Mark A. McKnight</h4>
                                                    <p class="text-muted">@webdesigner</p>
                                                </div>

                                                <button type="button" class="btn btn-success btn-sm w-sm waves-effect m-t-10 waves-light">  <i class="ti-pencil-alt"></i> Edit</button>
                                                <button type="button" class="btn btn-danger btn-sm w-sm waves-effect m-t-10 waves-light"> <i class="ti-trash"></i> Delete</button>

                                                <p class="text-muted font-13 m-t-20">
                                                    Hi I'm Johnathn Deo,has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type.
                                                </p>

                                                <hr/>

                                                <div class="text-left">
                                                    <p class="text-muted font-13"><strong>Full Name :</strong> <span class="m-l-15">Johnathan Deo</span></p>

                                                    <p class="text-muted font-13"><strong>Phone :</strong><span class="m-l-15">(123) 123 1234</span></p>

                                                    <p class="text-muted font-13"><strong>Mobile :</strong><span class="m-l-15">(123) 123 1234</span></p>

                                                    <p class="text-muted font-13"><strong>Email :</strong> <span class="m-l-15">coderthemes@gmail.com</span></p>

                                                    <p class="text-muted font-13"><strong>Location :</strong> <span class="m-l-15">USA</span></p>
                                                </div>

                                            </div>

                                        </div> <!-- end card-box -->

                                    </div> <!-- end col -->

                                </div>

                            </div>

                        </div>
                    </div>
                </div>

            </div>

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/patient/PatientController.js"></script>
        <script>

            $(function () {
            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>