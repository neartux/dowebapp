<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div id="modalUploadImage" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-30">
        <div class="modal-content p-0 b-0">
            <form novalidate name="patientFormU">
                <div class="panel panel-color panel-warning">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title">
                            <spring:message code="patient.label.detail.profile.picture"/> {{ ctrl.patientTOPreview.firstName }} {{ ctrl.patientTOPreview.lastName }}
                        </h3>
                    </div>
                    <div class="panel-body">

                        <div class="row col-sm-12">
                            <div class="col-sm-12">
                                <a>
                                    <img class="media-object m-r-10" alt="{{ ctrl.patientTOPreview.firstName }} {{ ctrl.patientTOPreview.lastName }}"
                                         data-ng-src="${pageContext.request.contextPath}/patient/getProfilePicture?url={{ ctrl.patientTOPreview.profileImage }}" style="width: 96px; height: 96px;"/>
                                </a>
                            </div>
                            <div class="col-sm-12 text-right">
                                <div class="form-group m-b-0">
                                    <label class="control-label"><spring:message code="patient.label.detail.choose.image"/></label>
                                    <input type="file" class="filestyle" data-buttonname="btn-primary" id="profilePicturePatient">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> <spring:message code="label.common.button.close"/></button>
                        &nbsp;&nbsp;
                        <a class="btn btn-primary" data-ng-click="ctrl.validateAndUploadProfilPicturePatient();">
                            <i class="mdi mdi-upload"></i> <spring:message code="label.common.button.upload.image"/>
                        </a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>