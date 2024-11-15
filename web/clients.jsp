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
        <style>
            .modal-overlay {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: rgba(0, 0, 0, 0.5);
                display: flex;
                justify-content: center;
                align-items: center;
                z-index: 50;
            }

            .modal-content {
                background: white;
                padding: 1.5rem;
                border-radius: 0.5rem;
                box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1);
                max-width: 500px;
                width: 90%;
                position: relative;
            }
        </style>
    </head>
    <body class="bg-gray-50">
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
        <main class="max-w-7xl mx-auto py-6 px-4 sm:px-6 lg:px-8">
            <div>
                <%
                if (clientController.err.length() > 0)
                { 
                %>
                <div class="my-4 text-center text-red-500 bg-red-100 border border-red-400 p-3 rounded"> 
                    <%= clientController.err %> 
                </div>
                <%  
                }
                    clientController.err.setLength(0);
                if (clientController.success.length() > 0)
                { 
                %>
                <div class="my-4 text-center text-green-500 bg-green-100 border border-green-400 p-3 rounded"> 
                    <%= clientController.success %> 
                </div>
                <%  
                }
                    clientController.success.setLength(0);
                %>
                <div class="max-w-2xl mx-auto space-y-6">
                    <%
                        for (int i = 0; i < clients.size(); i++)
                        {
                    %>
                    <div class="bg-white rounded-lg shadow-md p-6 space-y-3">
                        <p class="text-lg font-semibold">Name: <%= clients.get(i).get(0) %></p>
                        <p class="flex items-center text-gray-600">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 5.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"/>
                            </svg>
                            Email: <%= clients.get(i).get(1) %>
                        </p>
                        <p class="flex items-center text-gray-600">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 5a2 2 0 012-2h3.28a1 1 0 01.948.684l1.498 4.493a1 1 0 01-.502 1.21l-2.257 1.13a11.042 11.042 0 005.516 5.516l1.13-2.257a1 1 0 011.21-.502l4.493 1.498a1 1 0 01.684.949V19a2 2 0 01-2 2h-1C9.716 21 3 14.284 3 6V5z"/>
                            </svg>
                            Phone: <%= clients.get(i).get(2) %>
                        </p>
                        <p class="text-gray-600">Password: <%= clients.get(i).get(3) %></p>
                        <p class="flex items-center text-gray-600">
                            <svg class="w-4 h-4 mr-2" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M17.657 16.657L13.414 20.9a1.998 1.998 0 01-2.827 0l-4.244-4.243a8 8 0 1111.314 0z"/>
                                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 11a3 3 0 11-6 0 3 3 0 016 0z"/>
                            </svg>
                            Address: <%= clients.get(i).get(4) %>
                        </p>
                        <p class="text-gray-600">IsKeyClient: 
                            <span class="px-2 py-1 text-xs font-medium <%= clients.get(i).get(5).toString().equals("t") ? "bg-blue-100 text-blue-800" : "bg-red-100 text-red-800" %> rounded-full">
                                <%= clients.get(i).get(5) %>
                            </span>
                        </p>
                        <form class="mt-4">
                            <input type="hidden" name="clientIndex" value="<%= i %>">
                            <button type="submit" name="edit" value="edit" class="w-full bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded transition duration-150 ease-in-out">
                                Edit
                            </button>
                        </form>
                    </div>
                    <%
                        }
                        
                        String edt = request.getParameter("edit");
                        String clientIndex = request.getParameter("clientIndex");
                        if (edt != null && clientIndex != null)
                        {                    
                            int index = Integer.parseInt(clientIndex);
                    %>
                    <div class="modal-overlay">
                        <div class="modal-content">
                            <form name="editClient" action="Client" method="POST" class="space-y-4">
                                <input type="hidden" name="clientIndexPost" value="<%= clientIndex %>" />
                                <div class="space-y-2">
                                    <label for="name" class="block text-sm font-medium text-gray-700">Name</label>
                                    <input value="<%= clients.get(index).get(0) %>" type="text" name="name" 
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                </div>
                                <div class="space-y-2">
                                    <label for="email" class="block text-sm font-medium text-gray-700">Email</label>
                                    <input value="<%= clients.get(index).get(1) %>" type="email" name="email"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                </div>
                                <div class="space-y-2">
                                    <label for="phone" class="block text-sm font-medium text-gray-700">Phone</label>
                                    <input value="<%= clients.get(index).get(2) %>" type="text" name="phone"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                </div>
                                <div class="space-y-2">
                                    <label for="password" class="block text-sm font-medium text-gray-700">Password</label>
                                    <input value="<%= clients.get(index).get(3) %>" type="password" name="password"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                </div>
                                <div class="space-y-2">
                                    <label for="address" class="block text-sm font-medium text-gray-700">Address</label>
                                    <input value="<%= clients.get(index).get(4) %>" type="text" name="address"
                                           class="w-full px-3 py-2 border border-gray-300 rounded-md shadow-sm focus:ring-blue-500 focus:border-blue-500">
                                </div>
                                <div class="space-y-2">
                                    <label for="isKeyClient" class="block text-sm font-medium text-gray-700">IsKeyClient</label>
                                    <input type="checkbox" name="isKeyClient" value="true"
                                           <%= clients.get(index).get(5).toString().equals("t") ? "checked" : "" %>
                                           class="h-4 w-4 text-blue-600 focus:ring-blue-500 border-gray-300">
                                </div>
                                <div class="flex space-x-4 mt-6">
                                    <button type="submit" name="editClient" value="Edit" 
                                            class="flex-1 bg-blue-500 hover:bg-blue-600 text-white font-medium py-2 px-4 rounded transition duration-150 ease-in-out">
                                        Save Changes
                                    </button>
                                </div>
                            </form>
                            <form>
                                <button type="submit" name="close" value="Close"
                                        class="w-full mt-4 bg-gray-200 hover:bg-gray-300 text-gray-800 font-medium py-2 px-4 rounded transition duration-150 ease-in-out">
                                    Cancel
                                </button>
                            </form>
                        </div>
                    </div>
                    <%          
                        String close = request.getParameter("close");
                        if (close != null)
                        {
                            edt = null;
                            clientIndex = null;
                        }
                        }
                    %>
                </div>
            </div>
        </main>
    </body>
</html>