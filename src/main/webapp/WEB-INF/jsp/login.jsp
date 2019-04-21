<%-- 
    Document   : login
    Created on : 5 Mar, 2019, 5:54:28 PM
    Author     : Abeer
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Meta, title, CSS, favicons, etc. -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>DigiTeach </title>



        <link href="css/bootstrap.min.css" rel="stylesheet">

        <link href="fonts/css/font-awesome.min.css" rel="stylesheet">
        <link href="css/animate.min.css" rel="stylesheet">

        <!-- Custom styling plus plugins -->
        <link href="css/custom.css" rel="stylesheet">
        <link href="css/icheck/flat/green.css" rel="stylesheet">


        <script src="js/jquery.min.js"></script>



    </head>

    <body style="background:#F7F7F7;">

        <div class="">
            <a class="hiddenanchor" id="toregister"></a>
            <a class="hiddenanchor" id="tologin"></a>

            <div id="wrapper">
                <div id="login" class="animate form">
                    <section class="login_content">
                        <form action="login.htm" method="post">
                            <h1>Login </h1>
                            <div>
                                <input type="text" class="form-control" name="name" placeholder="Username" required="" />
                            </div>
                            <div>
                                <input type="password" class="form-control" name="password" placeholder="Password" required="" />
                            </div>
                            <div>
                           <button class="btn btn-default submit" >Log In</button>
                            </div>
                            <div class="clearfix"></div>
                            <div class="separator">

                                <div class="clearfix"></div>
                                <br />
                            </div>
                        </form>
                    </section>
                </div>
            </div>
        </div>
          <%@ include file="footer.jsp" %>
    </body>
</html>
