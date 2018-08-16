<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>

<div id="doctorDataView" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="doctorForm">
                <div class="panel panel-color panel-success">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i
                                class="ti-close"></i></button>
                        <h3 class="panel-title"><spring:message code="doctor.label.list.new.doctor.title"/> </h3>
                    </div>
                    <div class="panel-body">

                        <div class="row">
                            <div class="col-sm-12">

                                <div class="border m-b-20"></div>

                                <div class="media">
                                    <div class="media-left">
                                        <a>
                                            <img class="media-object m-r-10"
                                                 alt="{{ ctrl.doctorTO.firstName }} {{ ctrl.doctorTO.lastName }}"
                                                 data-ng-src="${pageContext.request.contextPath}/doctor/getProfilePicture?url={{ ctrl.doctorTO.profileImage }}"
                                                 style="width: 96px; height: 96px;"/>
                                        </a>
                                    </div>
                                    <div class="media-body text-dark bold">
                                        <div class="col-sm-6">
                                            <h4 class="media-heading">
                                                {{ ctrl.doctorTO.firstName }} {{ ctrl.doctorTO.lastName }}
                                            </h4>

                                            <div class="row col-sm-12">
                                                <i class="mdi mdi-cake font-20 text-warning"></i> <span>{{ ctrl.doctorTO.birthDateString }}</span>
                                                &nbsp;(<span class="text-muted m-b-30 font-13">{{ ctrl.doctorTO.birthDateExplain }}</span>)
                                            </div>
                                            <div class="row col-sm-12">
                        <span data-ng-show="ctrl.doctorTO.sex === '${SEX_MALE}'">
                            <i class="mdi mdi-human-male font-20 text-primary"></i> <spring:message code="doctor.label.detail.sex.male"/>
                        </span>
                                                <span data-ng-show="ctrl.doctorTO.sex === '${SEX_FEMALE}'">
                            <i class="mdi mdi-human-female font-20 text-pink"></i> <spring:message code="doctor.label.detail.sex.female"/>
                        </span>
                                            </div>

                                        </div>
                                        <div class="col-sm-6">
                                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-cellphone-android font-20 text-brown"></i> {{ ctrl.doctorTO.cellPhone }}
                            </span>
                                            </div>
                                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-deskphone font-20"></i> {{ ctrl.doctorTO.phone }}
                            </span>
                                            </div>
                                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-map-marker-plus font-20 text-info"></i> {{ ctrl.doctorTO.address }}
                            </span>
                                            </div>
                                            <div class="row col-sm-12">
                            <span>
                                <i class="mdi mdi-email-open font-20 text-success"></i> {{ ctrl.doctorTO.email }}
                            </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i
                                class="ti-close"></i> <spring:message code="label.common.button.close"/>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>