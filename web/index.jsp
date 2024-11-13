<%-- 
    Document   : index
    Created on : 11 Nov 2024, 07:37:55
    Author     : Wian van Niekerk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.LoginController"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%
            if (session == null || session.getAttribute("loggedIn") == null)
            {
                response.sendRedirect("login.jsp");
            }
            if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
                LoginController.logout(session);
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <jsp:include page="Components/navbar.jsp" />
    </body>
</html>
