<%-- 
    Document   : add_gallery
    Created on : Jan 31, 2018, 12:20:30 PM
    Author     : ATPL
--%>




<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="UserSessionValidation.jsp" %>

<!DOCTYPE html>
<html>
    <head>

        <%@ include file="meta.jsp" %>
        <title>Add Picture</title>
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

        <script type="text/javascript">
            $(document).ready(function () {
                $("#name").keyup(function () {

                    var content = $("#name").val(); //content is now the value of the text box
                    var num_words = content.length; //num_words is the number of words in the array
                    var max_limit = 100;
                    if (num_words > max_limit) {
                        //alert("Exceeding the max limit");
                        document.getElementById("applimit").innerHTML = "Exceeding the Max Limit";
                        var lastIndex = content.lastIndexOf(" ");
                        $("#name").val(content.substring(lastIndex));
                        $('#remainingChars').text('Limit Exceeding');
                        return false;
                    } else
                    {
                        $('#remainingChars').text(max_limit + 1 - num_words + " Character remaining");
                    }
                });
            });
        </script>

        <script type="text/javascript">
            var setTotalNumberOfWordCounter = "100";
            function displayWordCounter() {
                var getTextValue = document.frm.dd_fc_comment.value;  // Get input textarea value
                var getTextLength = getTextValue.length;   // Get length of input textarea value
                if (getTextLength > setTotalNumberOfWordCounter) {     //compare this length with total count
                    getTextValue = getTextValue.substring(0, setTotalNumberOfWordCounter);
                    document.frm.dd_fc_comment.value = getTextValue;
                    return false;
                }
                document.frm.totalWordLimit.value = (setTotalNumberOfWordCounter - getTextLength);
            }
        </script>

        <script type="text/javascript">
            $(document).ready(function () {
                $(".description").keyup(function () {

                    var content = $("#description").val();
                    //content is now the value of the text box
                    var num_words = content.length; //num_words is the number of words in the array
                    var max_limit = 4000;
                    if (num_words > max_limit) {
                        //alert("Exceeding the max limit");
                        document.getElementById("applimit1").innerHTML = "Exceeding the Max Limit";
                        var lastIndex = content.lastIndexOf(" ");
                        $("#title").val(content.substring(0, lastIndex));
                        $('#remainingChars1').text('Limit Exceeding');
                        return false;
                    } else
                    {
                        $('#remainingChars1').text(max_limit + 1 - num_words + " Character remaining");
                    }
                });
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
                if (file.size > 102) {
                    alert('Max Upload size is 1MB only');
                    document.getElementById("img").value = '';
                    return false;
                }
                return true;
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

                var img = parseFloat($("#imgicon")[0].files[0].size / 1024).toFixed(2);

                if (img < 1 || img > 1000)  // validation according to file size
                {
                    $("#iconsize").show();
                    document.getElementById("imgicon").value = "";
                    document.getElementById("iconsize").innerHTML = "Image size Should be between 1 KB to 1 MB";
                    $("#blah").attr('src', "images/default1.png");
                } else if (input.files && input.files[0]) {
                    $("#iconsize").hide();
                    var reader = new FileReader();

                    reader.onload = function (e) {
                        $('#blah')
                                .attr('src', e.target.result)
                                .width(150)
                                .height(200);
                    };
                    reader.readAsDataURL(input.files[0]);
                }
            }

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

//                var img = parseFloat($("#imgicon1")[0].files[0].size / 1024).toFixed(2);
//
//                if (img < 1 || img > 1000)  // validation according to file size
//                {
//                    $("#iconsize").show();
//                    document.getElementById("imgicon1").value = "";
//                    document.getElementById("iconsize1").innerHTML = "Image size Should be between 1 KB to 1 MB";
//                    $("#blah").attr('src', "images/default1.png");
//                } else if (input.files && input.files[0]) {
//                    $("#iconsize1").hide();
//                    var reader = new FileReader();
//
//                    reader.onload = function (e) {
//                        $('#blah1')
//                                .attr('src', e.target.result)
//                                .width(250)
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
        <script type="text/javascript">
            function spostRequest() {
                var admissionid = document.getElementById("admissionid").value;
                var dateofbirth = document.getElementById("dateofbirth").value;
                if (admissionid != '' && dateofbirth != '') {
                    var filter = "admissionid=" + admissionid + "&dateofbirth=" + dateofbirth;
<!--alert(filter);-->

                    edu__application_form_validation('http://dpsgfbd.edunext1.com', filter)
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
                                        <form  class="form-horizontal form-label-left" action="add_picture.htm" method="post" enctype="multipart/form-data">
                                            <span class="section">Edit</span>
                                            <p class="error" style="color: red;font-size: large;text-align: center;">${message}</p>

                                            <div class="item form-group">
                                                <div class="input-group">

                                                    <input type="hidden" name="id" value="${id}"  class="form-control" >
                                                </div>
                                            </div>



                                            <div class="item form-group">
                                                <label class="control-label col-md-3 col-sm-3 col-xs-12" for="cover-photo">Photo<span class="required"></span>
                                                </label>					
                                                <div class="col-md-8 col-sm-6 col-xs-12">
                                                    <img id="blah1" src="../images/default2.png" style="width: 250px;height: 200px" />
                                                    <input type='file' name="Photo" id="imgicon1"   onchange="readURL1(this);" style="text-align:center; margin: 0 auto"  />
                                                </div>
                                                <p id="iconsize1" style="color: red;text-align: center"></p>
                                            </div>
                                            <br>
                                            <div class="ln_solid"></div>
                                            <div class="form-group">
                                                <div class="col-md-6 col-md-offset-3">
                                                    <!--<a href="AppManagement.htm"><button type="button" class="btn btn-primary">Back</button></a>-->
                                                    <input type="submit" class="btn btn-success" value="Submit">
                                                </div>
                                            </div>
                                        </form> 

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

           
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
        </div>
        <%@ include file="footer.jsp" %>
    </body>

</html>




