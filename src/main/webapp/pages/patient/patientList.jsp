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

        <div class="content" data-ng-app="Patient" data-ng-controller="PatientController as ctrl"
             data-ng-init="ctrl.init('${pageContext.request.contextPath}');">

            <div class="container" data-ng-show="!ctrl.isViewDetailsPatient">

                <jsp:include page="patientTable.jsp"/>

            </div>

            <div class="container" data-ng-show="ctrl.isViewDetailsPatient">

                <jsp:include page="patientDetails.jsp"/>

            </div>

            <!-- Modal, to create or update patient data -->
            <jsp:include page="patientForm.jsp"/>
            <!-- Modal, to upload profile picture patient -->
            <jsp:include page="uploadProfilePicturePatient.jsp"/>

        </div>

    </tiles:putAttribute>

    <tiles:putAttribute name="scripts">
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/datatables/dataTables.bootstrap.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-datatable/angular-datatables.min.js"></script>

        <script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/bootstrap-filestyle/js/bootstrap-filestyle.min.js"></script>
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

                $(":file").filestyle({input: false});

            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>