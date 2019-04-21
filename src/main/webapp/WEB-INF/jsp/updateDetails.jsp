<html lang="en">

    <head>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Update  </title>

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
        <script src="js/jquery.min.js"></script>




    </head>


    <body class="nav-md">

        <div class="container body">


            <div class="main_container">
                <%@ include file="menu.jsp" %>
                <%@ include file="topNavigationView.jsp" %>



                <!-- page content -->


                <!-- top tiles -->
                <div class="right_col" role="main">
                    <div class="x_title">

                        <ul class="nav navbar-right panel_toolbox">

                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <form action="updateDetails.htm"  class="form-horizontal" method="post" >
                        <div class="col-sm-8">
                            <div class="input-group">

                                <input type="hidden" name="id" value="${id}"  class="form-control" >
                            </div>
                        </div>


                        <div class="col-md-12 col-sm-12 col-xs-12">
                            <div class="x_panel ">
                                <div class="x_title">
                                    <h2>Update Details</h2>

                                    <p align="right">  
                                        <button type="button"  class="btn btn-default"><b><a style="text-decoration:none " href="edituser.htm?id=${id}" >Edit Personal Details</a></b></button><button type="button"  class="btn btn-default"><b><a style="text-decoration:none " href="add_picture.htm?id=${id}" >Edit profile picture</a></b></button>
                                    </p>
                                    <div class="clearfix"></div>
                                </div>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
        <%@ include file="footer.jsp" %>
    </body>

</html>

