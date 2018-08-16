<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>

<div id="doctorDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="doctorForm">
                <div class="panel panel-color panel-success">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title"><spring:message code="doctor.label.list.new.doctor.title"/></h3>
                    </div>
                    <div class="panel-body">
                        <h4 class="m-t-0 text-success bold">
                            <i class="mdi mdi-account-location"></i> <spring:message code="doctor.label.detail.personal.information"/>
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.firstName.$invalid && !doctorForm.firstName.$pristine }">
                                    <label for="field-name" class="control-label"><spring:message code="doctor.label.detail.names"/> *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.firstName" required name="firstName"
                                           class="form-control" id="field-name" maxlength="50">
                                    <span ng-show="doctorForm.firstName.$invalid && !doctorForm.firstName.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.names.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.lastName.$invalid && !doctorForm.lastName.$pristine }">
                                    <label for="field-lastName" class="control-label"><spring:message code="doctor.label.detail.last.name"/> *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.lastName" required name="lastName"
                                           class="form-control" id="field-lastName" maxlength="50">
                                    <span ng-show="doctorForm.lastName.$invalid && !doctorForm.lastName.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.last.name.required"/>.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.birthDate.$invalid && !doctorForm.birthDate.$pristine }">
                                    <label for="field-birthDate" class="control-label"><spring:message code="doctor.label.detail.birthdate"/> *</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="field-birthDate" name="birthDate" required>
                                        <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar text-white"></i></span>
                                    </div>
                                    <span ng-show="doctorForm.birthDate.$invalid && !doctorForm.birthDate.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.birthdate.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.sexType.$invalid && !doctorForm.sexType.$pristine }">
                                    <label class="control-label"><spring:message code="doctor.label.detail.sex"/> *</label>
                                    <br> <br>
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.doctorTO.sex" value="${SEX_FEMALE}"
                                               class="icheck" i-check data-skin="square" data-color="pink" required> <spring:message code="doctor.label.detail.sex.female"/>
                                    </label> &nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.doctorTO.sex" value="${SEX_MALE}"
                                               class="icheck" i-check data-skin="square" data-color="blue"> <spring:message code="doctor.label.detail.sex.male"/>
                                    </label>
                                    <span ng-show="doctorForm.sexType.$invalid && !doctorForm.sexType.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.sex.required"/>.</span>
                                </div>
                            </div>
                        </div>

                        <h4 class="text-success bold">
                            <i class="mdi mdi-map-marker-plus"></i> <spring:message code="doctor.label.detail.location.data"/>
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6" ng-class="{ 'has-error' : doctorForm.address.$invalid && !doctorForm.address.$pristine }">
                                <div class="form-group">
                                    <label for="field-address" class="control-label"><spring:message code="doctor.label.detail.address"/> *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.address" required name="address"
                                           class="form-control" id="field-address" maxlength="150">
                                    <span ng-show="doctorForm.address.$invalid && !doctorForm.address.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.address.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.cellPhone.$invalid && !doctorForm.cellPhone.$pristine }">
                                    <label for="field-cellPhone" class="control-label"><spring:message code="doctor.label.detail.cell.phone"/> *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.cellPhone" required name="cellPhone"
                                           class="form-control" id="field-cellPhone" maxlength="15">
                                    <span ng-show="doctorForm.cellPhone.$invalid && !doctorForm.cellPhone.$pristine"
                                          class="help-block"><spring:message code="doctor.label.detail.cell.phone.required"/> .</span>
                                </div>
                            </div>
                        </div>

                        <div data-ng-show="ctrl.isCreateDoctor">

                            <h4 class="text-success bold">
                                <i class="mdi mdi-account-settings-variant"></i> <spring:message code="doctor.label.detail.user.account"/>
                            </h4>
                            <hr class="m-t-0 m-b-5">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-userName" class="control-label"><spring:message code="doctor.label.detail.user.name"/> *</label>
                                        <input type="text" data-ng-model="ctrl.doctorTO.userName" name="userName"
                                               class="form-control" id="field-userName" maxlength="50">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-password" class="control-label"><spring:message code="doctor.label.detail.user.password"/> *</label>
                                        <input type="password" data-ng-model="ctrl.doctorTO.password" name="contrasena"
                                               class="form-control" id="field-password" maxlength="50">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-repeatPassword" class="control-label"><spring:message code="doctor.label.detail.user.password.repeat"/> *</label>
                                        <input type="password" data-ng-model="ctrl.doctorTO.repeatPassword" name="repeatPassword"
                                               class="form-control" id="field-repeatPassword" maxlength="50">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> <spring:message code="label.common.button.close"/> </button>
                        <button type="button" class="btn btn-info waves-effect waves-light"
                                data-ng-disabled="doctorForm.$invalid"
                                data-ng-click="ctrl.validateDoctor(doctorForm.$valid)">
                            <i class="ti-save"></i> <spring:message code="label.common.button.save.changes"/>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>