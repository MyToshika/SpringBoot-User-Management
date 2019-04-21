<%-- 
    Document   : usermanagement
    Created on : 11 Dec, 2018, 1:04:23 PM
    Author     : Abeer
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="UserSessionValidation.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <%@ include file="meta.jsp" %>
        <%@ include file="css.jsp" %>
       
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Register User </title>

        <!-- Bootstrap core CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">


        <!-- Custom styling plus plugins -->
        <link href="css/custom.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="css/maps/jquery-jvectormap-2.0.1.css" />
        <link href="css/icheck/flat/green.css" rel="stylesheet" />
        <link href="css/floatexamples.css" rel="stylesheet" type="text/css" />
        <link href="css/datatables/tools/css/dataTables.tableTools.css" rel="stylesheet">
<!--        <script src="js/jquery.min.js"></script>
        <script src="js/nprogress.js"></script>-->
        <script>
            NProgress.start();
        </script>



    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <%@ include file="menu.jsp" %>
                <%@ include file="topNavigationView.jsp" %>



                <!-- page content -->


                <!-- top tiles -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="page-title">
                            <div class="title_left">
                                <h3>

                                    <small>

                                    </small>
                                </h3>
                            </div>


                        </div>
                        <div class="clearfix"></div>

                        <div class="row">

                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>User Data <small></small></h2>
                                        <ul class="nav navbar-right panel_toolbox">

                                        </ul>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>
                                                        S.NO
                                                    </th>
                                                    <th>Name</th>
                                                    <th>Email</th>
                                                    <th>PhoneNo</th>
                                                    <th>Password </th>
                                                    <th>Status</th>
                                                    <th>Date</th>
                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                    </th>
                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:set var="j" value="1" scope="page" />
                                                <c:forEach items="${list}" var="var">
                                                    <tr class="even pointer">
                                                        <td class="a-center ">
                                                            ${j}
                                                        </td>
                                                        <td class=" ">${var.name}</td>
                                                        <td class=" "> ${var.email}</td>
                                                        <td class=" ">${var.phone} 
                                                        </td>
                                                        <td class=" ">${var.password}</td>
                                                        <td class=" ">${var.status}</td>
                                                        <td class="">${var.currentDate}</td>
                                                        <td class=" last"><a href="updateDetails.htm?id=${var.id}">Edit Details</a>
                                                        </td>
                                                        <c:set var="j" value="${j+1}" scope="page" />
                                                    </tr>
                                                </c:forEach>

                                            </tbody>

                                        </table>
                                    </div>
                                </div>
                            </div>

                            <br />
                            <br />
                            <br />

                        </div>
                    </div>
                </div>
                <!-- /page content -->
            </div>

        </div>

        <div id="custom_notifications" class="custom-notifications dsp_none">
            <ul class="list-unstyled notifications clearfix" data-tabbed_notifications="notif-group">
            </ul>
            <div class="clearfix"></div>
            <div id="notif-group" class="tabbed_notifications"></div>
        </div>

        <!-- Datatables -->
<!--        <script src="js/bootstrap.min.js"></script>

         chart js 
        <script src="js/chartjs/chart.min.js"></script>
         bootstrap progress js 
        <script src="js/progressbar/bootstrap-progressbar.min.js"></script>
        <script src="js/nicescroll/jquery.nicescroll.min.js"></script>
         icheck 
        <script src="js/icheck/icheck.min.js"></script>

        <script src="js/custom.js"></script>-->


        <!-- Datatables -->
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
        <!-- /datepicker -->
        <!-- /footer content -->
        <%@ include file="footer.jsp" %>
    </body>

</html>

