<div id="modalUploadImage" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" style="display: none;">
    <div class="modal-dialog width-30">
        <div class="modal-content p-0 b-0">
            <form novalidate name="patientForm">
                <div class="panel panel-color panel-warning">
                    <div class="panel-heading">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></button>
                        <h3 class="panel-title">
                            Profile Picture {{ ctrl.doctorTO.firstName }} {{ ctrl.doctorTO.lastName }}
                        </h3>
                    </div>
                    <div class="panel-body">

                        <div class="row col-sm-12">
                            <div class="col-sm-12">
                                <a>
                                    <img class="media-object m-r-10" alt="{{ ctrl.doctorTO.firstName }} {{ ctrl.doctorTO.lastName }}"
                                         data-ng-src="${pageContext.request.contextPath}/patient/getProfilePicture?url={{ ctrl.doctorTO.profileImage }}" style="width: 96px; height: 96px;"/>
                                </a>
                            </div>
                            <div class="col-sm-12 text-right">
                                <div class="form-group m-b-0">
                                    <label class="control-label">Selecciona imagen</label>
                                    <input type="file" class="filestyle" data-buttonname="btn-primary" id="profilePictureDoctor">
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel-footer text-right">
                        <a class="btn btn-primary" data-ng-click="ctrl.validateAndUploadProfilPictureDoctor();">
                            <i class="mdi mdi-upload"></i> Subir Imagen
                        </a> &nbsp;&nbsp;
                        <button type="button" class="btn btn-default waves-effect" data-dismiss="modal"><i class="ti-close"></i> Cerrar</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>