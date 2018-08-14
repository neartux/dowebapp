<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<div class="row">
    <div class="col-xs-12">
        <div class="page-title-box">
            <h4 class="page-title"><spring:message code="patient.label.list.title"/> </h4>
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
    <div class="col-sm-12">
        <div class="panel panel-color panel-primary">
            <div class="panel-heading">
                <h3 class="panel-title"><i class="mdi mdi-hospital-marker"></i> <spring:message code="patient.label.list.patients"/></h3>
                <button type="button" data-ng-click="ctrl.viewToCreateNewPatient();"
                        class="btn btn-default btn-rounded w-md waves-effect btn-sm pull-right m-t-22">
                    <i class="mdi mdi-account-plus"></i> <spring:message code="patient.label.list.new.patient"/>
                </button>
            </div>
            <div class="panel-body">

                <div class="row">
                    <div class="col-sm-12">
                        <table dt-options="ctrl.dtOptions" dt-columns="ctrl.dtColumns"
                               dt-instance="ctrl.dtInstance" datatable=""
                               class="table table-striped table-colored table-info dataTable no-footer">
                            <thead>
                            <tr>
                                <th class="text-uppercase bold"></th>
                                <th class="text-uppercase bold"></th>
                                <th class="text-uppercase bold"></th>
                                <th class="text-uppercase bold"></th>
                                <th class="text-uppercase bold"></th>
                            </tr>
                            </thead>
                        </table>
                    </div>
                </div>

            </div>
        </div>
    </div>
</div>