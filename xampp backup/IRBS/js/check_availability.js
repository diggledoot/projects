//onload initialization
$(document).ready(() => {
    import {test} from 'test-import';
    formatDate = (date) => {
        var day = date.getDate().toString();
        var month = (date.getMonth() + 1).toString();
        var year = date.getFullYear();

        if (day.length < 2) {
            day = "0" + day;
        }
        if (month.length < 2) {
            month = "0" + month;
        }

        var formattedDate = [day, month, year].join('/');
        return formattedDate;
    }

    console.log("It's ready and loaded!");
    var today = new Date();
    var tmr = new Date();
    tmr.setDate(tmr.getDate() + 1);

    $('#startDate').val(formatDate(today));
    $('#endDate').val(formatDate(tmr));

    $('#startDate').attr('min', $('#startDate').val());
    $('#endDate').attr('min', $('#endDate').val());



    //test Date
    $('#startDate').val(formatDate(today)).datepicker({
        dateFormat: 'dd/mm/yy',
        minDate: today,
    });

    $('#endDate').val(formatDate(tmr)).datepicker({
        dateFormat: 'dd/mm/yy',
        minDate: tmr,
    });

    //change methods
    $('#startDate').on('change', () => {
        var endDate = new Date($('#startDate').datepicker('getDate'));
        $('#endDate').datepicker('option', 'minDate', endDate);
        endDate.setDate(endDate.getDate() + 1);

        $('#endDate').datepicker('setDate', endDate);
    })

    $('#availSubmit').on('click', (e) => {
        e.preventDefault();
        
        
        
        //test imported function
        test();
        
        //initalizations
        var one_day = 1000 * 60 * 60 * 24;
        var string_startDate = $("#startDate").val();
        var string_endDate = $("#endDate").val();


        //check date difference
        var date_startDate = new Date(string_startDate);
        var date_endDate = new Date(string_endDate);
        var diff = (date_endDate.getTime() - date_startDate.getTime()) / one_day;

        //bookings cannot be -1 or 0 days. TESTING PURPOSES
        if (diff < 1) {
            console.log("Invalid booking!");
        } else {
            console.log("Valid booking!");
        }
        //code below does get request or whatever
        console.log($('#startDate').datepicker('getDate'));
        console.log($('#endDate').datepicker('getDate'));
    })

});
