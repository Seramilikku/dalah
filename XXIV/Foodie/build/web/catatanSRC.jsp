<%-- 
    Document   : catatanSRC
    Created on : Jul 14, 2023, 2:28:25 PM
    Author     : user
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");
    if (username != null) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/uascall_srcadmin","uascall_usrcami","AMYqcn7vNSRw");
            String query = "SELECT * FROM daftarsrc WHERE username=?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setString(1, username);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String usernameDB = resultSet.getString("username");
                String passwordDB = resultSet.getString("password");
                String emailDB = resultSet.getString("email");
                String phoneNumberDB = resultSet.getString("phone_number");
                String genderDB = resultSet.getString("gender");
                %>
                <!DOCTYPE html>
                <html lang="id">
                <head>
                    <meta charset="utf-8">
                    <title>Ubah Data Pengguna</title>
                    <link rel="stylesheet" href="style.css">
                </head>
                <body>
                    <div class="bg">
                    <div class="container">
                        <h1>Ubah Data Pengguna</h1>
                        <form method="post" action="simpanDataSRC.jsp">
                            <input type="hidden" name="username" value="<%= usernameDB %>">
                            <label>Password</label><br>
                            <input type="password" name="password" value="<%= passwordDB %>"><br>
                            <label>Alamat E-mail</label><br>
                            <input type="email" name="email" value="<%= emailDB %>"><br>
                            <label>Nomor Hp</label><br>
                            <input type="tel" name="phone_number" value="<%= phoneNumberDB %>"><br>
                            <label>Gender</label><br>
                            <select name="gender">
                                <option value="male" <%= genderDB.equals("male") ? "selected" : "" %>>Male</option>
                                <option value="female" <%= genderDB.equals("female") ? "selected" : "" %>>Female</option>
                            </select><br>
                            <button type="submit">Simpan</button>
                        </form>
                    </div>
                    </div>
                </body>
                </html>
                <%
            } else {
                out.println("Data pengguna tidak ditemukan.");
            }

            resultSet.close();
            statement.close();
            connection.close();
        } catch (Exception e) {
            out.println(e.getMessage());
        }
    } else {
        response.sendRedirect("loginSRC.html");
    }
%>
