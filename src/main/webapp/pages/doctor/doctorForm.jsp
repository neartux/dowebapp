<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>

<div id="doctorDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="doctorForm">
                <div class="panel panel-color panel-success">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title">Nuevo M&eacute;dicos</h3>
                    </div>
                    <div class="panel-body">
                        <h4 class="m-t-0 text-success bold">
                            <i class="mdi mdi-account-location"></i> Informaci&oacute;n Personal
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.firstName.$invalid && !doctorForm.firstName.$pristine }">
                                    <label for="field-name" class="control-label">Nombres *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.firstName" required name="firstName"
                                           class="form-control" id="field-name" maxlength="50">
                                    <span ng-show="doctorForm.firstName.$invalid && !doctorForm.firstName.$pristine"
                                          class="help-block">El nombre es requerido.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.lastName.$invalid && !doctorForm.lastName.$pristine }">
                                    <label for="field-lastName" class="control-label">Apellidos *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.lastName" required name="lastName"
                                           class="form-control" id="field-lastName" maxlength="50">
                                    <span ng-show="doctorForm.lastName.$invalid && !doctorForm.lastName.$pristine"
                                          class="help-block">Los apellidos son requeridos.</span>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.birthDate.$invalid && !doctorForm.birthDate.$pristine }">
                                    <label for="field-birthDate" class="control-label">Fecha Cumplea&ntilde;os *</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="field-birthDate" name="birthDate" required>
                                        <span class="input-group-addon bg-custom b-0"><i class="mdi mdi-calendar text-white"></i></span>
                                    </div>
                                    <span ng-show="doctorForm.birthDate.$invalid && !doctorForm.birthDate.$pristine"
                                          class="help-block">Fecha cumplea&ntilde;os es requerido.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.sexType.$invalid && !doctorForm.sexType.$pristine }">
                                    <label class="control-label">Sexo *</label>
                                    <br> <br>
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.doctorTO.sex" value="${SEX_FEMALE}"
                                               class="icheck" i-check data-skin="square" data-color="pink" required> Femenino
                                    </label> &nbsp;&nbsp;&nbsp;
                                    <label>
                                        <input type="radio" name="sexType" data-ng-model="ctrl.doctorTO.sex" value="${SEX_MALE}"
                                               class="icheck" i-check data-skin="square" data-color="blue"> Masculino
                                    </label>
                                    <span ng-show="doctorForm.sexType.$invalid && !doctorForm.sexType.$pristine"
                                          class="help-block">El sexo es requerido.</span>
                                </div>
                            </div>
                        </div>

                        <h4 class="text-success bold">
                            <i class="mdi mdi-map-marker-plus"></i> Informaci&oacute;n de Ubicaci&oacute;n
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6" ng-class="{ 'has-error' : doctorForm.address.$invalid && !doctorForm.address.$pristine }">
                                <div class="form-group">
                                    <label for="field-address" class="control-label">Direcci&oacute;n *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.address" required name="address"
                                           class="form-control" id="field-address" maxlength="150">
                                    <span ng-show="doctorForm.address.$invalid && !doctorForm.address.$pristine"
                                          class="help-block">La direcci&oacute;n es requerido.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorForm.cellPhone.$invalid && !doctorForm.cellPhone.$pristine }">
                                    <label for="field-cellPhone" class="control-label">Celular *</label>
                                    <input type="text" data-ng-model="ctrl.doctorTO.cellPhone" required name="cellPhone"
                                           class="form-control" id="field-cellPhone" maxlength="15">
                                    <span ng-show="doctorForm.cellPhone.$invalid && !doctorForm.cellPhone.$pristine"
                                          class="help-block">El celular es requerido.</span>
                                </div>
                            </div>
                        </div>

                        <div data-ng-show="ctrl.isCreateDoctor">

                            <h4 class="text-success bold">
                                <i class="mdi mdi-account-settings-variant"></i> Cuenta Usuario
                            </h4>
                            <hr class="m-t-0 m-b-5">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-userName" class="control-label">Nombre usuario *</label>
                                        <input type="text" data-ng-model="ctrl.doctorTO.userName" name="userName"
                                               class="form-control" id="field-userName" maxlength="50">
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-password" class="control-label">Contrase&ntilde;a *</label>
                                        <input type="password" data-ng-model="ctrl.doctorTO.password" name="contrasena"
                                               class="form-control" id="field-password" maxlength="50">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="field-repeatPassword" class="control-label">Repetir contrase&ntilde;a *</label>
                                        <input type="password" data-ng-model="ctrl.doctorTO.repeatPassword" name="repeatPassword"
                                               class="form-control" id="field-repeatPassword" maxlength="50">
                                    </div>
                                </div>
                            </div>

                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> Cerrar</button>
                        <button type="button" class="btn btn-info waves-effect waves-light"
                                data-ng-disabled="doctorForm.$invalid"
                                data-ng-click="ctrl.validateDoctor(doctorForm.$valid)">
                            <i class="ti-save"></i> Guardar Cambios
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>