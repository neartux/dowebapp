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
        "timeOut": "5000",
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

var NUMBER_ZERO = 0;
var NUMBER_ONE = 1;
var ELEMENT_NOT_FOUND = undefined;