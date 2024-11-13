<%-- 
    Document   : clients
    Created on : 11 Nov 2024, 08:25:40
    Author     : Wian van Niekerk
--%>

<%@page import="Controller.LoginController"%>
<%@page import="Model.Base"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="Controller.ClientController"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Clients</title>
        <script src="https://cdn.tailwindcss.com"></script>
    </head>
    <body>
        <%
            ClientController clientController = new ClientController();
            ArrayList<ArrayList<Base>> clients = clientController.getAllClients();
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
        <main class="max-w-7xl mx-auto py-6 sm:px-6 lg:px-8">
            <div class="flex justify-center">
                <div class="w-full max-w-md space-y-6">
                    <%
                        for (int i = 0; i < clients.size(); i++) {
                            ArrayList<Base> client = clients.get(i);
                    %>
                    <div class="bg-white rounded-lg shadow-md p-6 hover:shadow-lg transition duration-300 ease-in-out">
                        <div class="space-y-2">
                            <div class="flex items-center space-x-2">
                                <svg class="h-5 w-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                                </svg>
                                <p class="text-gray-800">
                                    <span class="font-medium">Name:</span> 
                                    <span class="text-gray-600"><%= client.get(0) %></span>
                                </p>
                            </div>
                            <div class="flex items-center space-x-2">
                                <svg class="h-5 w-5 text-gray-500" fill="none" stroke="currentColor" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                                </svg>
                                <p class="text-gray-800">
                                    <span class="font-medium">Email:</span> 
                                    <span class="text-gray-600"><%= client.get(1) %></span>
                                </p>
                            </div>
                        </div>
                        <div class="mt-4 flex justify-end space-x-2">
                            <button class="px-3 py-1 text-sm text-blue-600 hover:text-blue-800 font-medium rounded-md hover:bg-blue-50 transition duration-150 ease-in-out">
                                Edit
                            </button>
                            <button class="px-3 py-1 text-sm text-red-600 hover:text-red-800 font-medium rounded-md hover:bg-red-50 transition duration-150 ease-in-out">
                                Delete
                            </button>
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>
            </div>
        </main>
    </body>
</html>
