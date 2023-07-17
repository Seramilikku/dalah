<%-- 
    Document   : logoutSRC
    Created on : Jul 12, 2023, 9:45:36 PM
    Author     : user
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% 
    session.invalidate();
    response.sendRedirect("loginSRC.html");
%>
