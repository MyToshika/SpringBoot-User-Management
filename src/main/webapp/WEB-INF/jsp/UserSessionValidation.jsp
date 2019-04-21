<%
    if (session.getAttribute("username") == null) {
        request.setAttribute("message", "Invalid username & password. Try Again.");
        RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
        rd.forward(request, response);
    }
%>