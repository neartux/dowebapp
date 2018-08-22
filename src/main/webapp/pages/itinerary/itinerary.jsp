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

        <div class="content" data-ng-app="DoctorsOffice" data-ng-controller="ItineraryController as ctrl"
             data-ng-init="ctrl.init('${pageContext.request.contextPath}', '${patternDiary}', '${MINUTS_DATE}');">

            <div class="container">

                <div class="row">
                    <div class="col-xs-12">
                        <div class="page-title-box">
                            <h4 class="page-title">Itinerario </h4>
                            <ol class="breadcrumb p-0 m-0">
                                <li>
                                    <a href="#">Home</a>
                                </li>
                                <li class="active">
                                    Itinerarios
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
                                <h3 class="panel-title"><i class="fa fa-calendar-check-o"></i> Itinerarios</h3>
                            </div>
                            <div class="panel-body">

                                <div class="row">

                                    <div class="col-sm-12">
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="field-doctof" class="control-label">Consultorio</label>
                                                <select id="field-doctof" data-ng-model="ctrl.itineraryData.data.officeId">
                                                    <option value="">Selecciona</option>
                                                    <option value="{{ df.id }}" data-ng-repeat="df in ctrl.doctorOfficesData.data">
                                                        {{ df.description }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="field-year" class="control-label">Año</label>
                                                <select id="field-year" data-ng-model="ctrl.itineraryData.data.year">
                                                    <option value="">Año</option>
                                                    <option value="{{ year.key }}" data-ng-repeat="year in ctrl.years.data">
                                                        {{ year.value }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <div class="form-group">
                                                <label for="field-month" class="control-label">Mes</label>
                                                <select id="field-month" data-ng-model="ctrl.itineraryData.data.month">
                                                    <option value="">Mes</option>
                                                    <option value="{{ month.key }}" data-ng-repeat="month in ctrl.months.data">
                                                        {{ month.value }}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <div class="col-sm-3">
                                            <a class="btn btn-success" data-ng-click="ctrl.findItineraryByOffice();">
                                                <i class="fa fa-search"></i>
                                                Buscar
                                            </a>
                                        </div>
                                    </div>

                                    <div class="col-sm-12">

                                        <h2 class="text-center" style="margin-top: 5px;">
                                            {{ ctrl.calendarTitle }}
                                        </h2>

                                        <jsp:include page="itineraryControls.jsp"/>

                                        <mwl-calendar
                                                events="ctrl.events"
                                                view="ctrl.calendarView"
                                                view-title="Itinerario"
                                                view-date="ctrl.viewDate"
                                                cell-is-open="ctrl.isCellOpen"
                                                on-event-click="ctrl.vieDetailsEvent(calendarEvent)"
                                                on-event-times-changed="ctrl.eventTimesChanged(calendarEvent); calendarEvent.startsAt = calendarNewEventStart; calendarEvent.endsAt = calendarNewEventEnd"
                                                data-edit-event-html="'<i class=\'glyphicon glyphicon-pencil\'></i>'"
                                                delete-event-html="'<i class=\'glyphicon glyphicon-remove text-danger\'></i>'"
                                                on-edit-event-click="ctrl.showUpdateActivity(calendarEvent, false);ctrl.isOptionCreateActivity = false;"
                                                on-delete-event-click="ctrl.deleteActivityById(calendarEvent)"
                                                day-view-start="00:00"
                                                day-view-end="23:59"
                                                day-view-split="30"
                                                on-timespan-click="ctrl.clickInDateToViewDay(calendarDate);"
                                                on-date-range-select="ctrl.selectRangeInDayView(calendarRangeStartDate, calendarRangeEndDate)"
                                                day-view-time-position="side">
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


        <script src="${pageContext.request.contextPath}/assets/js/app/itinerary/App.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/itinerary/ItineraryProvider.js"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/itinerary/ItineraryController.js?1.2"></script>
        <script src="${pageContext.request.contextPath}/assets/js/app/common/CommonDirectives.js"></script>
        <script>

            $(function () {

            });

        </script>

    </tiles:putAttribute>

</tiles:insertDefinition>