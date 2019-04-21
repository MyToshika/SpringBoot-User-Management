<%-- 
    Document   : feedback
    Created on : 24 Jan, 2019, 1:06:32 PM
    Author     : RAJIV
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="UserSessionValidation.jsp" %>
<!DOCTYPE html>
<html lang="en">
    <!--<![endif]-->
    <head>
        <%@ include file="meta.jsp" %>
        <title>digiTeach</title>
        <%@ include file="css.jsp" %>
    </head>
    <body class="nav-md">
        <div class="container body">
            <div class="main_container">
                <%@ include file="menu.jsp" %>
                <%@ include file="topNavigationView.jsp" %>
                <!-- page content -->
                <!-- page content -->
                <div class="right_col" role="main">
                    <div class="">
                        <div class="row">
                            <div class="col-md-12 col-sm-12 col-xs-12">
                                <div class="x_panel">
                                    <div class="x_title">
                                        <h2>Feedback</h2>
                                        <div class="nav navbar-right panel_toolbox">
                                            <!--                                            <a href="add_topic.htm" class="btn btn-success">Add New Topics</a>-->
                                        </div>
                                        <div class="clearfix"></div>
                                    </div>
                                    <div class="x_content">
                                        <table id="example" class="table table-striped responsive-utilities jambo_table">
                                            <thead>
                                                <tr class="headings">
                                                    <th>S.No</th>
                                                    <th>Name</th>
                                                    <!--                                                    <th>Class</th>-->
                                                    <th>Type</th>
                                                    <th>Feedback</th>
                                                    <th>Added Date</th>
                                                    <!--                                                    <th class=" no-link last"><span class="nobr">Action</span>
                                                                                                        </th>-->

                                                </tr>
                                            </thead>

                                            <tbody>
                                                <c:set var="j" value="1" scope="page" />
                                                <c:forEach items="${list}" var="var">
                                                    <tr class="even pointer">
                                                        <td class=" center"> ${j}</td>
                                                        <td class=" ">${var.user_name} </td>
                                                        <td class=" ">${var.type} </td>
                                                        <td class=" ">${var.feedback} </td>
                                                        <td class=" ">${var.created_date} </td>



                                                    </tr>
                                                    <c:set var="j" value="${j+1}" scope="page" /> 
                                                </c:forEach>


                                            </tbody>

                                        </table>
                                    </div>
                                    <p style="text-align: center;color: red">${deletemessage}</p>
                                </div>
                            </div>

                            <br />
                            <br />
                            <br />

                        </div>
                    </div>
                    <!-- footer content -->
                    <footer>
                        <div class="">
                            <p class="pull-right">
                                <span class="lead"> <i class="fa fa-paw"></i>digiTeach</span>
                            </p>
                        </div>
                        <div class="clearfix"></div>
                    </footer>
                    <!-- /footer content -->

                </div>
                <!-- /page content -->
            </div>

        </div>
        <%@ include file="tableFooter.jsp" %>
    </body>
</html>

