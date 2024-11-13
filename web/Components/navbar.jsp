<%-- 
    Document   : clients
    Created on : 13 Nov 2024, 09:22:38
    Author     : Wian van Niekerk
--%>
<%@page import="Controller.LoginController"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="bg-white shadow-lg">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex justify-between h-16">
            <div class="flex-shrink-0 flex items-center">
                <a href="/ApexCare" class="text-xl font-bold text-blue-600">ApexCare</a>
            </div>
            
            <div class="flex">
                <div class="flex space-x-8">
                    <a href="/ApexCare" 
                       class="<%= request.getRequestURI().endsWith("/ApexCare") || request.getRequestURI().endsWith("/index.jsp") ? 
                              "border-b-2 border-blue-500" : "border-b-2 border-transparent" %> 
                       inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-900 hover:border-gray-300">
                        Home
                    </a>
                    
                    <a href="clients.jsp" 
                       class="<%= request.getRequestURI().endsWith("/clients.jsp") ? 
                              "border-b-2 border-blue-500" : "border-b-2 border-transparent" %> 
                       inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-900 hover:border-gray-300">
                        Clients
                    </a>
                    
                    <a href="technicians.jsp" 
                       class="<%= request.getRequestURI().endsWith("/technicians.jsp") ? 
                              "border-b-2 border-blue-500" : "border-b-2 border-transparent" %> 
                       inline-flex items-center px-1 pt-1 text-sm font-medium text-gray-900 hover:border-gray-300">
                        Technicians
                    </a>
                </div>
            </div>
            
            <div class="flex items-center">
                <a href="?action=logout" 
                   class="text-sm font-medium text-gray-500 hover:text-gray-900 hover:bg-gray-100 px-3 py-2 rounded-md">
                    Logout
                </a>
            </div>
        </div>
    </div>
</nav>