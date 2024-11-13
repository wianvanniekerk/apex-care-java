<%-- 
    Document   : technicians
    Created on : 11 Nov 2024, 08:25:48
    Author     : Wian van Niekerk
--%>

<%@page import="Controller.LoginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technicians</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <jsp:include page="Components/navbar.jsp" />
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
        <h1>Manage Technicians</h1>
    </body>
</html>
