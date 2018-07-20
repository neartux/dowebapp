<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>
<div id="patientDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="patientForm">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                        <h3 class="panel-title">Nuevo Paciente</h3>
                    </div>
                    <div class="panel-body">
                        <h4 class="m-t-0 text-primary bold">
                            <i class="mdi mdi-account-location"></i> Informaci&oacute;n Personal
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.firstName.$invalid && !patientForm.firstName.$pristine }">
                                    <label for="field-name" class="control-label">First Name *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.firstName" required name="firstName"
                                           class="form-control" id="field-name" placeholder="John" maxlength="50">
                                    <span ng-show="patientForm.firstName.$invalid && !patientForm.firstName.$pristine"
                                          class="help-block">First name is required.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.lastName.$invalid && !patientForm.lastName.$pristine }">
                                    <label for="field-lastName" class="control-label">Last Name *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.lastName" required name="lastName"
                                           class="form-control" id="field-lastName" placeholder="Doe" maxlength="50">
                                    <span ng-show="patientForm.lastName.$invalid && !patientForm.lastName.$pristine"
                                          class="help-block">Last name is required.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.birthDate.$invalid && !patientForm.birthDate.$pristine }">
                                    <label for="field-birthDate" class="control-label">BirthDate *</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="field-birthDate" name="birthDate" required>
                                        <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar text-white"></i></span>
                                    </div>
                                    <span ng-show="patientForm.birthDate.$invalid && !patientForm.birthDate.$pristine"
                                          class="help-block">Birthdate is required.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.sexType.$invalid && !patientForm.sexType.$pristine }">
                                    <label class="control-label">Sex *</label>
                                    <br> <br>
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.patientTO.sex" value="${SEX_FEMALE}"
                                               class="icheck" i-check data-skin="square" data-color="pink" required> Female
                                    </label> &nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.patientTO.sex" value="${SEX_MALE}"
                                               class="icheck" i-check data-skin="square" data-color="blue"> Male
                                    </label>
                                    <span ng-show="patientForm.sexType.$invalid && !patientForm.sexType.$pristine"
                                          class="help-block">Sex is required.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.bloodType.$invalid && !patientForm.bloodType.$pristine }">
                                    <label for="field-bloodType" class="control-label">Blood Type *</label>
                                    <select name="bloodType" data-ng-model="ctrl.patientTO.bloodTypeId"
                                            id="field-bloodtype" class="form-control" required>
                                        <option value="">Select Option</option>
                                        <option value="{{ bloodType.id }}" data-ng-repeat="bloodType in ctrl.bloodTypeList.data">
                                            {{ bloodType.description }}
                                        </option>
                                    </select>
                                    <span ng-show="patientForm.bloodType.$invalid && !patientForm.bloodType.$pristine"
                                          class="help-block">bloodType is required.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-civilStatus" class="control-label">Civil Status</label>
                                    <select name="civilStatuss" id="field-civilStatus" class="form-control"
                                            data-ng-model="ctrl.patientTO.civilStatus">
                                        <option value="">Select Option</option>
                                        <option value="Soltero/a">Soltero/a</option>
                                        <option value="Comprometido/a">Comprometido/a</option>
                                        <option value="Casado/a">Casado/a</option>
                                        <option value="Divorciado/a">Divorciado/a</option>
                                        <option value="Viudo/a">Viudo/a</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <h4 class="text-primary bold">
                            <i class="mdi mdi-map-marker-plus"></i> Informaci&oacute; de Ubicaci&oacute;n
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6" ng-class="{ 'has-error' : patientForm.address.$invalid && !patientForm.address.$pristine }">
                                <div class="form-group">
                                    <label for="field-address" class="control-label">Address</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.address"
                                           class="form-control" id="field-address" maxlength="150">
                                    <span ng-show="patientForm.address.$invalid && !patientForm.address.$pristine"
                                          class="help-block">Cellphone is required.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : patientForm.cellPhone.$invalid && !patientForm.cellPhone.$pristine }">
                                    <label for="field-cellPhone" class="control-label">Cell Phone *</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.cellPhone" required name="cellPhone"
                                           class="form-control" id="field-cellPhone" maxlength="15">
                                    <span ng-show="patientForm.cellPhone.$invalid && !patientForm.cellPhone.$pristine"
                                          class="help-block">Cellphone is required.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-phone" class="control-label">Phone</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.phone"
                                           class="form-control" id="field-phone" maxlength="15">
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label for="field-email" class="control-label">Email</label>
                                    <input type="text" data-ng-model="ctrl.patientTO.email"
                                           class="form-control" id="field-email" maxlength="50">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-info waves-effect waves-light"
                                data-ng-disabled="patientForm.$invalid"
                                data-ng-click="ctrl.validatePatient(patientForm.$valid)">
                            Save changes
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>