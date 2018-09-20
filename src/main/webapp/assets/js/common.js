function showNotification(type, message) {
    toastr.clear();
    toastr[type](message);

    toastr.options = {
        "closeButton": true,
        "debug": false,
        "newestOnTop": true,
        "progressBar": true,
        "positionClass": "toast-top-right",
        "preventDuplicates": true,
        "onclick": null,
        "showDuration": "300",
        "hideDuration": "1000",
        "timeOut": "3000",
        "extendedTimeOut": "1000",
        "showEasing": "swing",
        "hideEasing": "linear",
        "showMethod": "fadeIn",
        "hideMethod": "fadeOut"
    }
}

function getConfigurationSwalConfirm(tittle, text, type, confirmButtonText) {
    return {
        title: tittle,
        text: text,
        type: type,
        showCancelButton: true,
        confirmButtonColor: "#DD6B55",
        confirmButtonText: confirmButtonText,
        cancelButtonClass: 'btn-default btn-md waves-effect',
        confirmButtonClass: 'btn-warning btn-md waves-effect waves-light',
        cancelButtonText: "No, cancelar!",
        closeOnConfirm: true,
        closeOnCancel: true
    };
}

function isValidField(field) {
    return field !== null && field !== undefined && $.trim(field).length > NUMBER_ZERO;
}

function calculateEdge(date) {
    // Get values date
    var values = date.split("-");
    var day = values[2];
    var month = values[1];
    var year = values[0];

    // Get current date
    var nowDate = new Date();
    var currentYear = nowDate.getYear();
    var currentMonth = nowDate.getMonth() + 1;
    var currentDay = nowDate.getDate();

    // Calculate the years
    var edge = (currentYear + 1900) - year;
    if (currentMonth < month) {
        edge--;
    }
    if ((month === currentMonth) && (currentDay < day)) {
        edge--;
    }
    if (edge > 1900) {
        edge -= 1900;
    }

    // Calculate the months
    var months = 0;
    if (currentMonth > month)
        months = currentMonth - month;
    if (currentMonth < month)
        months = 12 - (month - currentMonth);
    if (currentMonth === month && day > currentDay)
        months = 11;

    // Calculate the days
    var days = 0;
    if (currentDay > day)
        days = currentDay - day;
    if (currentDay < day) {
        days = new Date(currentYear, currentMonth, 0).getDate() - (day - currentDay);
    }

    var result = [];
    result[0] = edge;
    result[1] = months;
    result[2] = days;

    return result;
}

function getArrayMonths() {
    return [
        { key: '01', value: 'Enero'},
        { key: '02', value: 'Febrero'},
        { key: '03', value: 'Marzo'},
        { key: '04', value: 'Abril'},
        { key: '05', value: 'Mayo'},
        { key: '06', value: 'Junio'},
        { key: '07', value: 'Julio'},
        { key: '08', value: 'Agosto'},
        { key: '09', value: 'Septiempre'},
        { key: '10', value: 'Octubre'},
        { key: '11', value: 'Noviembre'},
        { key: '12', value: 'Diciembre'}
    ];
}

function getArrayYears() {
    var today = new Date();
    var currentYear = today.getFullYear();
    var startYear = 2017;

    var arrayYears =[];

    for (var i = startYear; i <= currentYear; i ++) {
        arrayYears.push({
            key: i,
            value: i
        });
    }
    return arrayYears;
}

var NUMBER_ZERO = 0;
var NUMBER_ONE = 1;
var ELEMENT_NOT_FOUND = undefined;