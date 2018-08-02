<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tiles:insertDefinition name="template">
    <tiles:putAttribute name="body">

        <!-- Styles -->
        <link type="text/css" href="${pageContext.request.contextPath}/assets/plugins/angular-calendar/angular-bootstrap-calendar.min.css" rel="stylesheet">

        <fmt:message key="label.common.pattern.date.diary" var="patternDiary"/>

        <div class="content" data-ng-app="DoctorsOffice" data-ng-controller="DiaryController as ctrl"
             data-ng-init="ctrl.init('${pageContext.request.contextPath}', '${patternDiary}');">

            <div class="container">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Agenda </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    Agendas
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
                                <h3 class="panel-title"><i class="fa fa-calendar-check-o"></i> Agendas</h3>
                            </div>
                            <div class="panel-body">

                                <div class="row">
                                    <div class="col-sm-12">

                                        <h2 class="text-center" style="margin-top: 5px;">
                                            {{ ctrlDiary.calendarTitle }}
                                            <button class="btn btn-primary btn-label pull-right"
                                                    data-ng-click="ctrlDiary.showCreateNewActivity();ctrlDiary.isOptionCreateActivity = true;">
                                                <i class="ti ti-pencil-alt"></i>
                                                Nueva Consulta
                                            </button>
                                        </h2>

                                        <jsp:include page="diaryControls.jsp"/>

                                        <mwl-calendar
                                                events="ctrlDiary.activitiesUser.data"
                                                view="ctrlDiary.calendarView"
                                                view-title="ctrlDiary.calendarTitle"
                                                view-date="ctrlDiary.viewDate"
                                                on-event-click="ctrlDiary.vieDetailsEvent(calendarEvent)"
                                                on-event-times-changed="ctrlDiary.eventTimesChanged(calendarEvent); calendarEvent.startsAt = calendarNewEventStart; calendarEvent.endsAt = calendarNewEventEnd"
                                                data-edit-event-html="'<i class=\'glyphicon glyphicon-pencil\'></i>'"
                                                delete-event-html="'<i class=\'glyphicon glyphicon-remove text-danger\'></i>'"
                                                on-edit-event-click="ctrlDiary.showUpdateActivity(calendarEvent, false);ctrlDiary.isOptionCreateActivity = false;"
                                                on-delete-event-click="ctrlDiary.deleteActivityById(calendarEvent)"
                                                day-view-start="00:00"
                                                day-view-end="23:59"
                                                day-view-split="30"
                                                on-timespan-click="ctrlDiary.addNewActivityToDateSpecific(calendarDate);ctrlDiary.isOptionCreateActivity = true;"
                                                cell-is-open="ctrlDiary.isCellOpen">
                                        </mwl-calendar>

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
        <script src="${pageContext.request.contextPath}/assets/plugins/moment/moment.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-calendar/interact.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-calendar/angular-animate.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-calendar/ui-bootstrap-tpls-2.5.0.min.js"></script>
        <script src="${pageContext.request.contextPath}/assets/plugins/angular-calendar/angular-bootstrap-calendar-tpls.min.js"></script>


        <script src="${pageContext.request.contextPath}/assets/js/app/diary/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/diary/DiaryProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/diary/DiaryController.js?1.2"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {

            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>