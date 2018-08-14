<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>
<div id="patientDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="patientForm">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title"><spring:message code="patient.label.detail.patient.informatino"/></h3>
                    </div>
                    <div class="panel-body">
                        <h4 class="m-t-0 text-primary bold">
                            <i class="mdi mdi-account-location"></i> <spring:message code="patient.label.detail.personal.information"/>
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.firstName.$invalid && !patientForm.firstName.$pristine }">
                                    <label for="field-name" class="control-label"><spring:message code="patient.label.detail.name"/> *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.firstName" required name="firstName"
                                           class="form-control" id="field-name" maxlength="50">
                                    <span ng-show="patientForm.firstName.$invalid && !patientForm.firstName.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.name.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.lastName.$invalid && !patientForm.lastName.$pristine }">
                                    <label for="field-lastName" class="control-label"><spring:message code="patient.label.detail.lastname"/> *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.lastName" required name="lastName"
                                           class="form-control" id="field-lastName" maxlength="50">
                                    <span ng-show="patientForm.lastName.$invalid && !patientForm.lastName.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.lastname.required"/>.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.birthDate.$invalid && !patientForm.birthDate.$pristine }">
                                    <label for="field-birthDate" class="control-label"><spring:message code="patient.label.detail.birthday.date"/> *</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="field-birthDate" name="birthDate" required>
                                        <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar text-white"></i></span>
                                    </div>
                                    <span ng-show="patientForm.birthDate.$invalid && !patientForm.birthDate.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.birthday.date.required"/> .</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.sexType.$invalid && !patientForm.sexType.$pristine }">
                                    <label class="control-label"><spring:message code="patient.label.detail.sex"/> *</label>
                                    <br> <br>
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.patientTO.sex" value="${SEX_FEMALE}"
                                               class="icheck" i-check data-skin="square" data-color="pink" required> <spring:message code="patient.label.detail.sex.female"/>
                                    </label> &nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.patientTO.sex" value="${SEX_MALE}"
                                               class="icheck" i-check data-skin="square" data-color="blue"> <spring:message code="patient.label.detail.sex.male"/>
                                    </label>
                                    <span ng-show="patientForm.sexType.$invalid && !patientForm.sexType.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.sex.required"/>.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.bloodType.$invalid && !patientForm.bloodType.$pristine }">
                                    <label for="field-bloodType" class="control-label"><spring:message code="patient.label.detail.blood.type"/> *</label>
                                    <select name="bloodType" data-ng-model="ctrl.patientTO.bloodTypeId"
                                            id="field-bloodtype" class="form-control" required>
                                        <option value=""><spring:message code="label.common.select"/></option>
                                        <option value="{{ bloodType.id }}" data-ng-repeat="bloodType in ctrl.bloodTypeList.data">
                                            {{ bloodType.description }}
                                        </option>
                                    </select>
                                    <span ng-show="patientForm.bloodType.$invalid && !patientForm.bloodType.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.blood.type.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-civilStatus" class="control-label"><spring:message code="patient.label.detail.civil.status"/></label>
                                    <select name="civilStatuss" id="field-civilStatus" class="form-control"
                                            data-ng-model="ctrl.patientTO.civilStatus">
                                        <option value=""><spring:message code="label.common.select"/></option>
                                        <option value="Soltero/a"><spring:message code="patient.label.detail.civil.status.single"/></option>
                                        <option value="Comprometido/a"><spring:message code="patient.label.detail.civil.status.committed"/></option>
                                        <option value="Casado/a"><spring:message code="patient.label.detail.civil.status.married"/></option>
                                        <option value="Divorciado/a"><spring:message code="patient.label.detail.civil.status.divorced"/></option>
                                        <option value="Viudo/a"><spring:message code="patient.label.detail.civil.status.widower"/></option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <h4 class="text-primary bold">
                            <i class="mdi mdi-map-marker-plus"></i> <spring:message code="patient.label.detail.location.information"/>
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6" ng-class="{ 'has-error' : patientForm.address.$invalid && !patientForm.address.$pristine }">
                                <div class="form-group">
                                    <label for="field-address" class="control-label"><spring:message code="patient.label.detail.address"/> *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.address" required name="address"
                                           class="form-control" id="field-address" maxlength="150">
                                    <span ng-show="patientForm.address.$invalid && !patientForm.address.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.address.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.cellPhone.$invalid && !patientForm.cellPhone.$pristine }">
                                    <label for="field-cellPhone" class="control-label"><spring:message code="patient.label.detail.cell.phone"/> *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.cellPhone" required name="cellPhone"
                                           class="form-control" id="field-cellPhone" maxlength="15">
                                    <span ng-show="patientForm.cellPhone.$invalid && !patientForm.cellPhone.$pristine"
                                          class="help-block"><spring:message code="patient.label.detail.cell.phone.required"/>.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-phone" class="control-label"><spring:message code="patient.label.detail.phone"/></label>
                                    <input type="text" data-ng-model="ctrl.patientTO.phone"
                                           class="form-control" id="field-phone" maxlength="15">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-email" class="control-label"><spring:message code="patient.label.detail.email"/></label>
                                    <input type="email" data-ng-model="ctrl.patientTO.email"
                                           class="form-control" id="field-email" maxlength="50">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> <spring:message code="label.common.button.close"/> </button>
                        <button type="button" class="btn btn-info waves-effect waves-light"
                                data-ng-disabled="patientForm.$invalid"
                                data-ng-click="ctrl.validatePatient(patientForm.$valid)">
                            <i class="ti-save"></i> <spring:message code="label.common.button.save.changes"/>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>