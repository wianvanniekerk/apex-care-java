<%-- 
    Document   : technicians
    Created on : 11 Nov 2024, 08:25:48
    Author     : Wian van Niekerk
--%>

<%@page import="Controller.Login"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Technicians</title>
    </head>
    <body>
        <%
            Login login = new Login();
            if (session == null || session.getAttribute("loggedIn") == null)
            {
                response.sendRedirect("login.jsp");
            }
        %>
        <h1>Manage Technicians</h1>
    </body>
</html>