<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="UserSessionValidation.jsp" %>
<html>
    <head>

        <%@ include file="meta.jsp" %>
        <title>Registration</title>
        <%@ include file="css.jsp" %>
        <script src="//cdn.ckeditor.com/4.4.7/full/ckeditor.js"></script>
        <script src="js/ckfinder.js"></script>
        <script src="js/ckeditor.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/demos/style.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <script>
            $(function () {
                $("#datepicker").datepicker();
            });
        </script>

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


            var check = function () {
                if (document.getElementById('password').value == document.getElementById('confirmPassword').value) {
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

        <script type="text/javascript">
            function validateImage() {
                var formData = new FormData();
                var file = document.getElementById("img").files[0];
                formData.append("Filedata", file);
                var t = file.type.split('/').pop().toLowerCase();
                if (t != "jpeg" && t != "jpg" && t != "png" && t != "bmp" && t != "gif") {
                    alert('Please select a valid image file');
                    document.getElementById("img").value = '';
                    return false;
                }

            }
        </script>


        <script type="text/javascript">
            function readURL(input) {


                var val = $('#imgicon').val().toLowerCase();
                var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp)$");


                if (!(regex.test(val))) {
                    $('#imgicon').val('');
                    $("#iconsize").show();
                    document.getElementById("iconsize").innerHTML = "Please select Image File Only";
                    $("#blah").attr('src', "images/default1.png");
                }

//                var img = parseFloat($("#imgicon")[0].files[0].size / 1024).toFixed(2);

//                if (img < 1 || img > 1000)  // validation according to file size
//                {
//                    $("#iconsize").show();
//                    document.getElementById("imgicon").value = "";
//                    document.getElementById("iconsize").innerHTML = "Image size Should be between 1 KB to 1 MB";
//                    $("#blah").attr('src', "images/default1.png");
//                } else if (input.files && input.files[0]) {
//                    $("#iconsize").hide();
//                    var reader = new FileReader();
//
//                    reader.onload = function (e) {
//                        $('#blah')
//                                .attr('src', e.target.result)
//                                .width(150)
//                                .height(200);
//                    };
//                    reader.readAsDataURL(input.files[0]);
//                }
//            }

        </script>

        <script type="text/javascript">
            function readURL1(input) {


                var val = $('#imgicon1').val().toLowerCase();
                var regex = new RegExp("(.*?)\.(jpg|png|gif|bmp)$");


                if (!(regex.test(val))) {
                    $('#imgicon1').val('');
                    $("#iconsize1").show();
                    document.getElementById("iconsize1").innerHTML = "Please select Image File Only";
                    $("#blah1").attr('src', "images/default1.png");
                }

                var img = parseFloat($("#imgicon1")[0].files[0].size / 1024).toFixed(2);

                if (img < 1 || img > 1000)  // validation according to file size
                {
                    $("#iconsize").show();
                    document.getElementById("imgicon1").value = "";
                    document.getElementById("iconsize1").innerHTML = "Image size Should be between 1 KB to 1 MB";
                    $("#blah").attr('src', "images/default1.png");
                } else if (input.files && input.files[0]) {
                    $("#iconsize1").hide();
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah1')
                                .attr('src', e.target.result)
                                .width(250)
                                .height(200);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $('#fileformat').change(function () {
                    var val = $(this).val().toLowerCase();
                    var regex = new RegExp("(.*?)\.(apk)$");
                    if (!(regex.test(val))) {
                        $(this).val('');
                        document.getElementById("fileformat1").innerHTML = "Please select apk file format";
                    }
                });
            });
        </script> 
    </head>


    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="menu.jsp" %>
                <%@ include file="topNavigationView.jsp" %>
                <!-- /top navigation -->
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">   
                                    <div class="x_content">
                                        <form action="registration.htm"  class="form-horizontal" method="post" enctype="multipart/form-data" >
                                            <span class="section">Registration</span>
                                            <p class="error" style="color: red;font-size: large;text-align: center;">${message}</p>
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
                                                        <input type="text" name="name" id="name" onkeypress="return onlyAlphabets(event, this);" class="form-control" required="">
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

                                                        <input name="password" id="password" type="password" class="form-control" onkeyup='check();' />
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

                                                        <input type="password" name="confirmPassword" class="form-control" id="confirmPassword"  onkeyup='check();' /> 
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
                                                    UID
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
                                                        <input type="text" name="uid"  class="form-control" value="" id="uid" required="">

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
                                                        <input class="form-control" id="currentDate" name="currentDate" placeholder="MM/DD/YYYY" type="text" autocomplete="off" required=""/>
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
                                            <div class="form-group">
                                                <label class="control-label col-sm-4 requiredField">
                                                    Gender
                                                    <span class="asteriskField">
                                                        *
                                                    </span>
                                                </label>
                                                <div class="col-md-6 col-sm-6 col-xs-12">
                                                    <div id="gender" class="btn-group">

                                                        <input type="radio" name="gender" value="male" checked=""> &nbsp; Male &nbsp;
                                                        <input type="radio" name="gender" value="female"> Female

                                                    </div>
                                                </div>
                                            </div>

                                            <div class="form-group ">
                                                <label class="control-label col-sm-4 requiredField" for="date">
                                                    Marks
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
                                                        <input type="text" name="marks" id="marks"  class="form-control" required="">
                                                    </div>
                                                </div>
                                            </div>  

                                            <div class="item form-group">
                                                <label class="control-label col-sm-4 requiredField" for="cover-photo">
                                                    Image
                                                    <span class="required"></span>
                                                </label>					
                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <img id="blah1" src="../images/default2.png" style="width: 250px;height: 200px" />
                                                    <input type='file' name="coverPhoto" id="imgicon1"   onchange="readURL1(this);" style="text-align:center; margin: 0 auto"  />
                                                </div>
                                                <p id="iconsize1" style="color: red;text-align: center"></p>
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
                        <!--                        <script src="js/bootstrap.min.js"></script>
                        
                                                 chart js 
                                                <script src="js/chartjs/chart.min.js"></script>
                                                 bootstrap progress js 
                                                <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
                                                <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
                                                 icheck 
                                                <script src="js/icheck/icheck.min.js"></script>
                        
                                                <script src="js/custom.js"></script>
                        
                        
                                                 Datatables -->
                        <script src="js/datatables/js/jquery.dataTables.js"></script>
                        <script src="js/datatables/tools/js/dataTables.tableTools.js"></script>
                        <script>
                            $(document).ready(function () {
                                $('input.tableflat').iCheck({
                                    checkboxClass: 'icheckbox_flat-green',
                                    radioClass: 'iradio_flat-green'
                                });
                            });

                            var asInitVals = new Array();
                            $(document).ready(function () {
                                var oTable = $('#example').dataTable({
                                    "oLanguage": {
                                        "sSearch": "Search all columns:"
                                    },
                                    "aoColumnDefs": [
                                        {
                                            'bSortable': false,
                                            'aTargets': [0]
                                        } //disables sorting for column one
                                    ],
                                    'iDisplayLength': 12,
                                    "sPaginationType": "full_numbers",
                                    "dom": 'T<"clear">lfrtip',
                                    "tableTools": {
                                        "sSwfPath": "<?php echo base_url('assets2/js/Datatables/tools/swf/copy_csv_xls_pdf.swf'); ?>"
                                    }
                                });
                                $("tfoot input").keyup(function () {
                                    /* Filter on the column based on the index of this element's parent <th> */
                                    oTable.fnFilter(this.value, $("tfoot th").index($(this).parent()));
                                });
                                $("tfoot input").each(function (i) {
                                    asInitVals[i] = this.value;
                                });
                                $("tfoot input").focus(function () {
                                    if (this.className == "search_init") {
                                        this.className = "";
                                        this.value = "";
                                    }
                                });
                                $("tfoot input").blur(function (i) {
                                    if (this.value == "") {
                                        this.className = "search_init";
                                        this.value = asInitVals[$("tfoot input").index(this)];
                                    }
                                });
                            });
                        </script>

                        <%@ include file="footer.jsp" %>
                        </body>
                        </html>
