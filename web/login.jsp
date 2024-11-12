<%-- 
    Document   : login
    Created on : 11 Nov 2024, 08:27:53
    Author     : Wian van Niekerk
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        <style>
            input {
                margin-bottom: 15px;
            }
            input {
                display: block;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <h1>Login</h1>
        <form action="Login" method="POST">
            <label for="email">Email</label>
            <input type="email" name="email">            
            <label for="password">Password</label>
            <input type="password" name="password">            
            <input type="submit" value="Login" name="login">
        </form>
    </body>
</html>
