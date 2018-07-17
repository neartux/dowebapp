<%@ page import="com.reliablesystems.doctoroffice.core.utils.common.ApplicationKeys" %>
<%@ c:taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="SEX_FEMALE" value="<%=ApplicationKeys.SEX_FEMALE%>"/>
<c:set var="SEX_MALE" value="<%=ApplicationKeys.SEX_MALE%>"/>
<div id="patientDataForm" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-45">
        <div class="modal-content p-0 b-0">
            <div class="panel panel-color panel-primary">
                <div class="panel-heading">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">x</button>
                    <h3 class="panel-title">New Patient</h3>
                </div>
                <div class="panel-body">
                    <h4 class="m-t-0">
                        Personal Data
                    </h4>
                    <hr class="m-t-0 m-b-5">
                    <div class="row">
                        <div class="col-sm-8">
                            <div class="thumb-xl member-thumb m-b-10 center-block">
                                <img src="${pageContext.request.contextPath}/assets/images/users/avatar-1.jpg" class="img-circle img-thumbnail" alt="profile-image">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-name" class="control-label">First Name *</label>
                                <input type="text" class="form-control" id="field-name" placeholder="John">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-lastName" class="control-label">Last Name *</label>
                                <input type="text" class="form-control" id="field-lastName" placeholder="Doe">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-birthDate" class="control-label">BirthDate *</label>
                                <input type="text" class="form-control" id="field-birthDate" placeholder="John">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-civilStatus" class="control-label">Civil Status</label>
                                <input type="text" class="form-control" id="field-civilStatus" placeholder="Doe">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="control-label">Sex</label>
                                <div class="button-list">
                                    <div class="btn-switch btn-switch-pink">
                                        <input type="checkbox" name="sexType" id="input-btn-female" value="${SEX_FEMALE}"/>
                                        <label for="input-btn-female"
                                               class="btn btn-rounded btn-pink waves-effect waves-light btn-xs">
                                            <em class="glyphicon glyphicon-ok"></em>
                                            <strong class="font-10"> Femenino <i class="fa fa-female"></i></strong>
                                        </label>
                                    </div>
                                    <div class="btn-switch btn-switch-teal">
                                        <input type="checkbox" name="sex" id="input-btn-male" value="${SEX_MALE}"/>
                                        <label for="input-btn-male"
                                               class="btn btn-rounded btn-teal waves-effect waves-light btn-xs">
                                            <em class="glyphicon glyphicon-ok"></em>
                                            <strong class="font-10"> Masculino <i class="fa fa-male"></i></strong>
                                        </label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-bloodType" class="control-label">Blood Type</label>
                                <select name="bloodType" data-ng-model="ctrl.patientTo.bloodTypeId"
                                        id="field-bloodtype" class="form-control">
                                    <option value="">Select Option</option>
                                    <option value="{{ bloodType.id }}" data-ng-repeat="bloodType in ctrl.bloodTypeList.data">
                                        {{ bloodType.description }}
                                    </option>
                                </select>
                            </div>
                        </div>
                    </div>

                    <h4>
                        Location Data
                    </h4>
                    <hr class="m-t-0 m-b-5">

                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-cellPhone" class="control-label">Cell Phone *</label>
                                <input type="text" class="form-control" id="field-cellPhone">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-phone" class="control-label">Phone</label>
                                <input type="text" class="form-control" id="field-phone">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-address" class="control-label">Address</label>
                                <input type="text" class="form-control" id="field-address">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="field-email" class="control-label">Email</label>
                                <input type="text" class="form-control" id="field-email">
                            </div>
                        </div>
                    </div>

                </div>
                <div class="panel-footer text-right">
                    <button type="button" class="btn btn-default waves-effect" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-info waves-effect waves-light">Save changes</button>
                </div>
            </div>
        </div>
    </div>
</div><!-- /.modal -->