<%-- 
    Document   : index
    Created on : 11 Nov 2024, 07:37:55
    Author     : Wian van Niekerk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.Login"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
    </head>
    <body>
       <%
            Login login = new Login();
            if (session == null || session.getAttribute("loggedIn") == null)
            {
                response.sendRedirect("login.jsp");
            }

            if (request.getParameter("action") != null && request.getParameter("action").equals("logout")) {
                login.logout();
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <h1>Welcome to ApexCare Solutions - System User Platform</h1>
        <nav>
            <ul>
                <li><a href="/ApexCare">Home</a></li>
                <li><a href="clients.jsp">Clients</a></li>
                <li><a href="technicians.jsp">Technicians</a></li>
            </ul>
        </nav>
        <a href="?action=logout">logout</a>
    </body>
</html>
