<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>

<div class="row">
    <div class="col-xs-12">
        <div class="page-title-box">
            <h4 class="page-title">
                <button type="button" data-ng-click="ctrl.isViewDetailsPatient = false;"
                        class="btn btn-block btn-xs btn-linkedin waves-effect waves-light">
                    <i class="mdi mdi-backburger"></i>
                    <spring:message code="patient.label.detail.message.back.list"/>
                </button>
            </h4>
            <ol class="breadcrumb p-0 m-0">
                <li>
                    <a href="#"><spring:message code="home.label.title"/></a>
                </li>
                <li>
                    <a href="#"><spring:message code="patient.label.list.patient"/> </a>
                </li>
                <li class="active">
                    <spring:message code="patient.label.list.title"/>
                </li>
            </ol>
            <div class="clearfix"></div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-lg-12">
        <div class="panel panel-color panel-info">
            <div class="panel-heading">
                <h3 class="panel-title text-uppercase">
                    <spring:message code="patient.label.detail.patient.informatino"/>
                </h3>
                <div class="border m-b-20"></div>
            </div>
            <div class="panel-body">

                <div class="media">
                    <div class="media-left">
                        <a data-ng-click="ctrl.viewChangeProfilePicture();">
                            <img class="media-object m-r-10" alt="{{ ctrl.patientTOPreview.firstName }} {{ ctrl.patientTOPreview.lastName }}"
                                 data-ng-src="${pageContext.request.contextPath}/patient/getProfilePicture?url={{ ctrl.patientTOPreview.profileImage }}" style="width: 96px; height: 96px;"/>
                        </a>
                    </div>
                    <div class="media-body text-dark bold">
                        <div class="col-sm-6">
                            <h4 class="media-heading">
                                {{ ctrl.patientTOPreview.firstName }} {{ ctrl.patientTOPreview.lastName }}
                            </h4>

                            <div class="row col-sm-12">
                                <i class="mdi mdi-book text-primary"></i><span><spring:message code="patient.label.detail.expedient"/>: # {{ ctrl.patientTOPreview.expedient }}</span>
                            </div>
                            <div class="row col-sm-12">
                                <i class="mdi mdi-cake font-20 text-warning"></i> <span>{{ ctrl.patientTOPreview.birthDateString }}</span>
                                &nbsp;(<span class="text-muted m-b-30 font-13">{{ ctrl.patientTOPreview.birthDateExplain }}</span>)
                            </div>
                            <div class="row col-sm-12">
                        <span data-ng-show="ctrl.patientTOPreview.sex === '${SEX_MALE}'">
                            <i class="mdi mdi-human-male font-20 text-primary"></i> <spring:message code="patient.label.detail.man"/>
                        </span>
                                <span data-ng-show="ctrl.patientTOPreview.sex === '${SEX_FEMALE}'">
                            <i class="mdi mdi-human-female font-20 text-pink"></i> <spring:message code="patient.label.detail.woman"/>
                        </span>
                            </div>
                            <div class="row col-sm-12" data-ng-show="ctrl.patientTOPreview.civilStatus">
                            <span>
                                <i class="mdi mdi-heart-outline font-20 text-orange"></i> {{ ctrl.patientTOPreview.civilStatus }}
                            </span>
                            </div>
                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-eyedropper font-20 text-danger"></i> {{ ctrl.patientTOPreview.bloodType }}
                            </span>
                            </div>

                            <a class="btn btn-xs btn-success waves-light waves-effect" data-ng-click="ctrl.viewToUpdatePatient(ctrl.patientTOPreview.patientIndex, ctrl.patientTOPreview);">
                                <i class="mdi mdi-pencil-box-outline"></i> <spring:message code="patient.label.detail.update"/>
                            </a>
                            <a class="btn btn-xs btn-danger waves-light waves-effect" data-ng-click="ctrl.deletePatient(ctrl.patientTOPreview.id);">
                                <i class="ti-trash"></i> <spring:message code="patient.label.detail.delete"/>
                            </a>
                        </div>
                        <div class="col-sm-6">
                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-cellphone-android font-20 text-brown"></i> {{ ctrl.patientTOPreview.cellPhone }}
                            </span>
                            </div>
                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-deskphone font-20"></i> {{ ctrl.patientTOPreview.phone }}
                            </span>
                            </div>
                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-map-marker-plus font-20 text-info"></i> {{ ctrl.patientTOPreview.address }}
                            </span>
                            </div>
                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-email-open font-20 text-success"></i> {{ ctrl.patientTOPreview.email }}
                            </span>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Dates History -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="timeline">
                            <article class="timeline-item alt">
                                <div class="text-right">
                                    <div class="time-show first">
                                        <a href="#" class="btn btn-danger w-lg">Today</a>
                                    </div>
                                </div>
                            </article>
                            <article class="timeline-item" ng-class-even="'alt'" ng-repeat="itemHistory in ctrl.historyPatient.data">
                                <div class="timeline-desk">
                                    <div class="panel">
                                        <div class="timeline-box">
                                            <span ng-class-odd="'arrow'" ng-class-even="'arrow-alt'"></span>
                                            <span class="timeline-icon bg-purple"><i class="mdi mdi-checkbox-blank-circle-outline"></i></span>
                                            <h4 class="text-purple">{{ itemHistory.startDate | date:'dd MMMM yyyy' }}</h4>
                                            <p class="timeline-date text-muted"><small>{{ itemHistory.startDate | date:'hh:mm a' }} / {{ itemHistory.endDate | date:'hh:mm a' }}</small></p>
                                            <p>{{ itemHistory.reason }}</p>
                                            <div class="album" ng-if="itemHistory.images">
                                                <%--<a href="#"><img alt="" src="assets/images/small/img-1.jpg"></a>--%>
                                                <%--<a href="#"><img alt="" src="assets/images/small/img-2.jpg"></a>--%>
                                            </div>
                                            <div class="clearfix"></div>
                                        </div>
                                    </div>
                                </div>
                            </article>
                        </div>
                    </div>
                </div>

            </div>
        </div>

    </div>

</div>