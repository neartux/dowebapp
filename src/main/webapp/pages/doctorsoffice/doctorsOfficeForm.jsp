<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<div id="doctorsOfficeDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <form novalidate name="doctorsOfficeForm">
                <div class="panel panel-color panel-primary">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title"><spring:message code="doctor.office.information.office"/></h3>
                    </div>
                    <div class="panel-body">
                        <h4 class="m-t-0 text-primary bold">
                            <i class="mdi mdi-account-location"></i> <spring:message code="doctor.office.information"/>
                        </h4>
                        <hr class="m-t-0 m-b-5">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorsOfficeForm.description.$invalid && !doctorsOfficeForm.description.$pristine }">
                                    <label for="field-description" class="control-label"><spring:message code="doctor.office.information.name"/> *</label>
                                    <input type="text" data-ng-model="ctrl.doctorsOfficeTO.description" required name="description"
                                           class="form-control" id="field-description" maxlength="50">
                                    <span ng-show="doctorsOfficeForm.description.$invalid && !doctorsOfficeForm.description.$pristine"
                                          class="help-block"><spring:message code="doctor.office.information.name.required"/>.</span>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group" ng-class="{ 'has-error' : doctorsOfficeForm.doctorId.$invalid && !doctorsOfficeForm.doctorId.$pristine }">
                                    <label for="field-doctorId" class="control-label"><spring:message code="doctor.office.information.doctor"/> *</label>
                                    <select name="doctorId" data-ng-model="ctrl.doctorsOfficeTO.doctorId"
                                            id="field-doctorId" class="form-control" required>
                                        <option value=""><spring:message code="label.common.select"/></option>
                                        <option value="{{ doctor.id }}" data-ng-repeat="doctor in ctrl.doctorData.data">
                                            {{ doctor.firstName }} {{ doctor.lastName }}
                                        </option>
                                    </select>
                                    <span ng-show="doctorsOfficeForm.doctorId.$invalid && !doctorsOfficeForm.doctorId.$pristine"
                                          class="help-block"><spring:message code="doctor.office.information.doctor.required"/></span>
                                </div>
                            </div>
                        </div>


                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> <spring:message code="label.common.button.close"/> </button>
                        <button type="button" class="btn btn-info waves-effect waves-light"
                                data-ng-disabled="doctorsOfficeForm.$invalid"
                                data-ng-click="ctrl.validateDoctorsOffice(doctorsOfficeForm.$valid)">
                            <i class="ti-save"></i> <spring:message code="label.common.button.save.changes"/>
                        </button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>