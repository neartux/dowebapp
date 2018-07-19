(function () {
    var app = angular.module('CommonDirectives', []);

    app.directive('ngEnter', function () {
        return function (scope, element, attrs) {
            element.bind("keydown keypress", function (event) {
                if (event.which === 13) {
                    scope.$apply(function () {
                        scope.$eval(attrs.ngEnter, {'event': event});
                    });

                    event.preventDefault();
                }
            });
        };
    });

    app.directive('iCheck', function () {
        return {
            require: 'ngModel',
            link: function ($scope, element, $attrs, ngModel) {
                var value;
                value = $attrs['value'];
                var color = $attrs.color;
                var skin = $attrs.skin;

                skin = skin && color ? skin + '-' + color : skin;

                $scope.$watch($attrs['ngModel'], function (newValue) {
                    $(element).iCheck('update');
                });

                $scope.$watch($attrs['ngDisabled'], function (newValue) {
                    $(element).iCheck(newValue ? 'disable' : 'enable');
                    $(element).iCheck('update');
                });

                return $(element).iCheck({
                    checkboxClass: skin ? 'icheckbox_' + skin : 'icheckbox_minimal',
                    radioClass: skin ? 'iradio_' + skin : 'iradio_minimal',
                    increaseArea: '20%'
                }).on('ifChanged', function (event) {
                    if ($(element).attr('type') === 'checkbox' && $attrs['ngModel']) {
                        $scope.$apply(function () {
                            return ngModel.$setViewValue(event.target.checked);
                        })
                    }
                }).on('ifClicked', function (event) {
                    if ($(element).attr('type') === 'radio' && $attrs['ngModel']) {
                        return $scope.$apply(function () {
                            //set up for radio buttons to be de-selectable
                            if (ngModel.$viewValue != value)
                                return ngModel.$setViewValue(value);
                            else
                                ngModel.$setViewValue(null);
                            ngModel.$render();
                            return;
                        });
                    }
                });
            }
        }
    });


})();

var NUMBER_ZERO = 0;
var NUMBER_ONE = 1;
var ELEMENT_NOT_FOUND = undefined;