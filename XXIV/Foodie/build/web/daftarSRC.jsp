<%-- 
    Document   : daftarSRC
    Created on : Jul 12, 2023, 10:25:20 AM
    Author     : user
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phone_number = request.getParameter("phone_number");
    String gender = request.getParameter("gender");

    if (username != null && !username.isEmpty() &&
        password != null && !password.isEmpty() &&
        email != null && !email.isEmpty() &&
        phone_number != null && !phone_number.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/uascall_srcadmin","uascall_usrcami","AMYqcn7vNSRw");
            String query = "INSERT INTO daftarsrc (username, password, email, phone_number, gender) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement statement = connection.prepareStatement(query);
            int min = 9;
            int max = 999;
            int randomNumber = (int) ((Math.random() * (max-min)) + min);;
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setString(3, email);
            statement.setString(4, phone_number);
            statement.setString(5, gender);
            int updatedQuery = statement.executeUpdate();
            statement.close();
            connection.close();
            response.sendRedirect("loginSRC.html");
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    } else {
        response.sendRedirect("daftarSRC.html?error=Harap isi semua data.");
    }
%>
