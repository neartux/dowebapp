<div class="row">

    <div class="col-md-6 text-center">
        <div class="btn-group">

            <button
                    ng-click="ctrl.findActivitiesByYear(ctrl.calendarView)"
                    class="btn btn-primary"
                    mwl-date-modifier
                    date="ctrl.viewDate"
                    decrement="ctrl.calendarView">
                ANTERIOR
            </button>
            <button
                    ng-click="ctrl.findActivitiesByYear(ctrl.calendarView)"
                    class="btn btn-default"
                    mwl-date-modifier
                    date="ctrl.viewDate"
                    set-to-today>
                HOY
            </button>
            <button
                    ng-click="ctrl.findActivitiesByYear(ctrl.calendarView)"
                    class="btn btn-primary"
                    mwl-date-modifier
                    date="ctrl.viewDate"
                    increment="ctrl.calendarView">
                SIGUIENTE
            </button>
        </div>
    </div>

    <br class="visible-xs visible-sm">

    <div class="col-md-6 text-center">
        <div class="btn-group">
            <label class="btn btn-primary" ng-model="ctrl.calendarView" uib-btn-radio="'year'">
                AÑO
            </label>
            <label class="btn btn-primary" ng-model="ctrl.calendarView" uib-btn-radio="'month'">
                MES
            </label>
            <label class="btn btn-primary" ng-model="ctrl.calendarView" uib-btn-radio="'week'">
                SEMANA
            </label>
            <label class="btn btn-primary" ng-model="ctrl.calendarView" uib-btn-radio="'day'">
                DIA
            </label>
        </div>
    </div>

</div>