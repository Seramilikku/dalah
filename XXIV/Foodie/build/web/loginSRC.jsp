<%-- 
    Document   : loginSRC
    Created on : Jul 12, 2023, 10:25:20 AM
    Author     : user
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");


    if (username != null && !username.isEmpty() &&
        password != null && !password.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/uascall_srcadmin","uascall_usrcami","AMYqcn7vNSRw");
            String query = "SELECT * FROM daftarsrc WHERE username=? AND password=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            statement.setString(2, password);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                session.setAttribute("username", username);
                response.sendRedirect("akunSRC.html");
            } else {
                response.sendRedirect("loginSRC.html?error=Username atau password salah");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    } else {
        response.sendRedirect("loginSRC.html?error=Username atau password salah");
    }
%>
