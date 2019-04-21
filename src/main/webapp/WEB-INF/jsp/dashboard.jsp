<%-- 
    Document   : dashboard.jsp
    Created on : Jan 23, 2018, 11:10:05 AM
    Author     : ATPL
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="UserSessionValidation.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
    <!--<![endif]-->
    <head>
        <%@ include file="meta.jsp" %>
        <title>Dashboard</title>
        <%@ include file="css.jsp" %>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="menu.jsp" %>
                <%@ include file="topNavigationView.jsp" %>
                <!-- page content -->
                <div class="right_col" role="main">

                    <div class="row">



                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel ">
                                <div class="x_title">
                                    <h2>Female Student Ranking</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <table id ="example1" class="table table-striped responsive-utilities jambo_table">
                                    <thead>

                                        <tr class = "even pointer">

                                        <tr class ="headings">



                                            <td align="center"><b>S.No</b></td>

                                            <td align="center"><b>Name </b></td>

                                            <td align="center"><b>Email</b></td>

                                            <td align="center"><b>Marks</b></td>

                                            <td align="center"><b>Phone No</b></td>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${femaleList}" var="var">
                                        <tr>
                                            <td align="center">${var.id}</td>
                                            <td align="center">${var.name}</td>
                                            <td align="center">${var.email}</td>
                                            <td align="center">${var.marks}</td>
                                            <td align="center">${var.phone}</td>

                                        </tr>
                                    </c:forEach>  
                                </table>

                            </div>


                        </div>
                    </div>
                    <br><br>
                    <div class="row">



                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel ">
                                <div class="x_title">
                                    <h2>Male Student Ranking</h2>

                                    <div class="clearfix"></div>
                                </div>

                                <table id ="example" class="table table-striped responsive-utilities jambo_table">
                                    <thead>

                                        <tr class = "even pointer">

                                        <tr class ="headings">


                                            <td align="center"><b>S.No</b></td>
                                            <td align="center"><b>Name</b></td>
                                            <td align="center"><b>Email</b></td>
                                            <td align="center"><b>Marks</b></td>
                                            <td align="center"><b>Phone No</b></td>
                                        </tr>
                                    </thead>
                                    <c:forEach items="${maleList}" var="var">
                                        <tr>
                                            <td align="center">${var.id}</td>
                                            <td align="center">${var.name}</td>
                                            <td align="center">${var.email}</td>
                                            <td align="center">${var.marks}</td>
                                            <td align="center">${var.phone}</td>

                                        </tr>
                                    </c:forEach>  
                                </table>

                            </div>


                        </div>
                    </div>



                    <br />

                    <%@ include file="footer.jsp" %>
                </div>
            </div>
        </div>
               
        


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
         <script>
            $(document).ready(function () {
                $('input.tableflat').iCheck({
                    checkboxClass: 'icheckbox_flat-green',
                    radioClass: 'iradio_flat-green'
                });
            });

            var asInitVals = new Array();
            $(document).ready(function () {
                var oTable = $('#example1').dataTable({
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

    </body>

</html>
