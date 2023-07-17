<%-- 
    Document   : simpanDataSRC
    Created on : Jul 14, 2023, 2:32:41 PM
    Author     : user
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String phoneNumber = request.getParameter("phone_number");
    String gender = request.getParameter("gender");

    if (username != null && !username.isEmpty()) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/uascall_srcadmin","uascall_usrcami","AMYqcn7vNSRw");
            String query = "UPDATE daftarsrc SET password=?, email=?, phone_number=?, gender=? WHERE username=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, password);
            statement.setString(2, email);
            statement.setString(3, phoneNumber);
            statement.setString(4, gender);
            statement.setString(5, username);
            int updatedQuery = statement.executeUpdate();

            if (updatedQuery > 0) {
                response.sendRedirect("akunSRC.html");
            } else {
                out.println("Gagal menyimpan perubahan data.");
            }

            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    } else {
        response.sendRedirect("loginSRC.html");
    }
%>
