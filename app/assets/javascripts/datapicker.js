$(document).ready(function () {
    var picker = new MaterialDatetimePicker({
            format: 'dd.MM.YY',
            styles: {
                scrim: 'c-scrim',
                back: 'c-datepicker__back',
                container: 'c-datepicker__calendar',
                date: 'c-datepicker__date',
                dayBody: 'c-datepicker__days-body',
                dayBodyElem: 'c-datepicker__day-body',
                dayConcealed: 'c-datepicker__day--concealed',
                dayDisabled: 'c-datepicker__day--disabled',
                dayHead: 'c-datepicker__days-head',
                dayHeadElem: 'c-datepicker__day-head',
                dayRow: 'c-datepicker__days-row',
                dayTable: 'c-datepicker__days',
                month: 'c-datepicker__month',
                next: 'c-datepicker__next',
                positioned: 'c-datepicker--fixed',
                selectedDay: 'c-datepicker__day--selected',
                selectedTime: 'c-datepicker__time--selected',
                time: 'c-datepicker__time',
                timeList: 'c-datepicker__time-list',
                timeOption: 'c-datepicker__time-option',
                clockNum: 'c-datepicker__clock__num'
            }
        })
        .on('submit', function (d) {
            $('#expires').val(d.format('YYYY-MM-DD HH:mm:ss'));
            console.log(d);
        });

    var el = document.querySelector('#expires');
    el.addEventListener('click', function () {
        picker.open();
    }, false);
});