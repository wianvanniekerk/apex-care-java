<%-- 
    Document   : login
    Created on : 11 Nov 2024, 08:27:53
    Author     : Wian van Niekerk
--%>

<%@page import="Controller.LoginController"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body class="min-h-screen flex items-center justify-center bg-gray-200">
        <%
            LoginController login = new LoginController();            
        %>
        <div class="bg-white p-8 rounded-lg shadow-md w-96">
            <h1 class="text-2xl font-bold mb-6 text-center text-gray-800">Login</h1>
            <%
                if (login.err.length() > 0)
                { 
            %>
            <p class="my-4 text-center text-red-500"> <%= login.err %> </p>
            <%  }
                login.err.setLength(0);
            %>
            <form action="Login" method="POST" class="space-y-4">
                <label class="block text-gray-700 text-sm font-bold mb-2" for="email">Email</label>
                <input class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-500" type="email" name="email">            
                <label class="block text-gray-700 text-sm font-bold mb-2" for="password">Password</label>
                <input class="w-full px-3 py-2 border border-gray-300 rounded-md focus:outline-none focus:ring-2 focus:ring-gray-500" type="password" name="password">            
                <input class="w-full bg-gray-500 text-white py-2 px-4 rounded-md hover:bg-gray-600 focus:outline-none focus:ring-2 focus:ring-gray-500" type="submit" value="Login" name="login">
            </form>
        </div>
    </body>
</html>
