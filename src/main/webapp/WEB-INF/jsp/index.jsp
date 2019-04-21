<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Digiteach Registration </title>
        <!--formden.js communicates with FormDen server to validate fields and submit via AJAX -->
        <script type="text/javascript" src="https://formden.com/static/cdn/formden.js"></script>
        <!-- Special version of Bootstrap that is isolated to content wrapped in .bootstrap-iso -->
        <link rel="stylesheet" href="https://formden.com/static/cdn/bootstrap-iso.css" />

        <!--Font Awesome (added because you use icons in your prepend/append)-->
        <link rel="stylesheet" href="https://formden.com/static/cdn/font-awesome/4.4.0/css/font-awesome.min.css" />

        <!-- Inline CSS based on choices in "Settings" tab -->
        <style>.bootstrap-iso .formden_header h2, .bootstrap-iso .formden_header p, .bootstrap-iso form{font-family: Arial, Helvetica, sans-serif; color: black}.bootstrap-iso form button, .bootstrap-iso form button:hover{color: white !important;} .asteriskField{color: red;}</style>

        <script language="Javascript" type="text/javascript">

            function onlyAlphabets(e, t) {
                try {
                    if (window.event) {
                        var charCode = window.event.keyCode;
                    } else if (e) {
                        var charCode = e.which;
                    } else {
                        return true;
                    }
                    if ((charCode > 64 && charCode < 91) || (charCode > 96 && charCode < 123))
                        return true;
                    else if (charCode == 32)
                        return true;
                    else
                        return false;
                } catch (err) {
                    alert(err.Description);
                }
            }
            function isNumber(evt) {
                evt = (evt) ? evt : window.event;
                var charCode = (evt.which) ? evt.which : evt.keyCode;
                if (charCode > 31 && (charCode < 48 || charCode > 57)) {
                    return false;
                }
                return true;
            }

            function validateEmail(emailField) {
                var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
                if (reg.test(emailField.value) == false)
                {
                    emailField.value = '';
                    alert('Please enter a valid email address.');
                    return false;
                }
                return true;

            }
            
            var check = function() {
  if (document.getElementById('password').value ==
    document.getElementById('confirm_password').value) {
    document.getElementById('message').style.color = 'green';
    document.getElementById('message').innerHTML = 'matching';
  } else {
    document.getElementById('message').style.color = 'red';
    document.getElementById('message').innerHTML = 'not matching';
  }
}


        </script>
        <script src="https://code.jquery.com/jquery-latest.min.js"></script>
        <script src='script.js'></script>
        <script src="https://rawgit.com/moment/moment/2.2.1/min/moment.min.js"></script>


        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery.inputmask/3.1.60/inputmask/jquery.inputmask.js"></script>

        <script type='text/javascript'>

        </script>
        <script>
            $j = jQuery.noConflict();

            $j(document).ready(function () {

                $j("#phone").inputmask("999 999 9999");

            });
        </script>

        <script>
            $j = jQuery.noConflict();

            $j(document).ready(function () {

                $j("#idNum").inputmask("999 9999 9999999 9");

            });
        </script>
            
        
    </head>


    <body style="background: #D3D3D3;">
        <br/>
        <!-- HTML Form (wrapped in a .bootstrap-iso div) -->
        <div class="bootstrap-iso" style="size:52; padding:10px; margin: auto; width: 50%;">
            <div class="container-fluid">
                <div class="row">
                    <br/>
                    <center> <font size="4"> <b> <p style="size:52; margin: auto; width: 50%;">Digiteach Registration</p></b></font></center>

                    <hr size="30">
                    <div class="clearfix"></div>
                    <div class="col-md-12 col-sm-12 col-xs-12">
                        <center> <font size="2"> <b> <p style="size:52; color:red; margin: auto; width: 50%;">${message}</p></b></font></center>
                        <br />
                        <form action="index.htm"  class="form-horizontal" method="post">
                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Enter Name
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-user">
                                            </i>
                                        </div>
                                        <input type="text" name="name" onkeypress="return onlyAlphabets(event, this);" class="form-control" required="">
                                    </div>
                                </div>
                            </div>  
                            <td>

                            </td>
                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Password
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-info">
                                            </i>
                                        </div>

                                        <input name="password" id="password" type="password" onkeyup='check();' />
                                         <span id='message'></span>
                                    </div>
                                </div>
                            </div>  
                             <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Confirm Password
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-info">
                                            </i>
                                        </div>

                                       <input type="password" name="confirm_password" id="confirm_password"  onkeyup='check();' /> 
                                        <span id='message'></span>
                                    </div>
                                </div>
                            </div>  

                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Enter Phone Number
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone">
                                            </i>
                                        </div>
                                        <input type="text" name="phone"  class="form-control" value="" id="phone" required="">

                                    </div>
                                </div>
                            </div>  
                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Status
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-phone">
                                            </i>
                                        </div>
                                        <input type="text" name="status"  class="form-control" value="" id="status" required="">

                                    </div>
                                </div>
                            </div>  
                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Date
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar">
                                            </i>
                                        </div>
                                        <input class="form-control" id="date" name="date" placeholder="MM/DD/YYYY" type="text" autocomplete="off" required=""/>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group ">
                                <label class="control-label col-sm-4 requiredField" for="date">
                                    Enter Email
                                    <span class="asteriskField">
                                        *
                                    </span>
                                </label>
                                <div class="col-sm-8">
                                    <div class="input-group">
                                        <div class="input-group-addon">
                                            <i class="fa fa-mail-reply">
                                            </i>
                                        </div>
                                        <input type="text" name="email" class="form-control" onblur="validateEmail(this);"  required="">
                                    </div>
                                </div>
                            </div>
                            <div class="ln_solid"></div>

                            <hr size="30">



                            <div class="form-group" style="margin: auto;">
                                <div class="col-sm-10 col-sm-offset-5">
                                    <input name="_honey" style="display:none" type="text"/>
                                    <button class="btn btn-primary " name="submit" type="submit">
                                        Submit
                                    </button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>



        <!-- Extra JavaScript/CSS added manually in "Settings" tab -->
        <!-- Include jQuery -->
        <script type="text/javascript" src="https://code.jquery.com/jquery-1.11.3.min.js"></script>

        <!-- Include Date Range Picker -->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

        <script>
                                            $(document).ready(function () {
                                                var today = new Date();
                                                var date_input = $('input[name="dob"]'); //our date input has the name "date"
                                                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                                                date_input.datepicker({
                                                    format: 'yyyy-mm-dd',
                                                    container: container,
                                                    todayHighlight: true,
                                                    autoclose: true,
                                                    endDate: "today",
                                                    maxDate: today,
                                                });
                                            });
        </script>
        <script>
            $(document).ready(function () {
                var datesEnabled = ['2019-2-1', '2019-2-2', '2019-2-3', '2019-2-4', '2019-2-5', '2019-2-6', '2019-2-7', '2019-2-8'];
                var today = new Date();
                var startDate = new Date(2019, 01, 1);
                var endDate = new Date(2019, 01, 08);
                var date_input = $('input[name="date_parti"]'); //our date input has the name "date"
                var container = $('.bootstrap-iso form').length > 0 ? $('.bootstrap-iso form').parent() : "body";
                date_input.datepicker({
                    format: 'mm/dd/yyyy',
                    startDate: startDate,
                    endDate: endDate,
                    container: container,
                    todayHighlight: true,
                    autoclose: true,
                    beforeShowDay: function (date) {
                        var allDates = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                        if (datesEnabled.indexOf(allDates) != -1)
                            return true;
                        else
                            return false;
                    }
                });
            });
        </script>
        <script src="https://rawgit.com/moment/moment/2.2.1/min/moment.min.js"></script>
        <script>
            $(document).ready(function () {
                $("#dob").change(function () {
                    var mdate = $("#dob").val().toString();
                    var yearThen = parseInt(mdate.substring(0, 4), 10);
                    var monthThen = parseInt(mdate.substring(5, 7), 10);
                    var dayThen = parseInt(mdate.substring(8, 10), 10);

                    var b = moment([yearThen, monthThen, dayThen]);
                    var a = moment([2018, 12, 07]);

                    var years = a.diff(b, 'year');
                    b.add(years, 'years');

                    var months = a.diff(b, 'months');
                    b.add(months, 'months');

                    var days = a.diff(b, 'days');


                    $("#exact_age").html("<span id=\"age\">" + years + " Years, " + months + " Months, " + days + " Days</span>");






                });
            });
        </script>

    </body>
</html>
