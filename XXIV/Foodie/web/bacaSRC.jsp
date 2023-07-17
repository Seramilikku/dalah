<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="utf-8">
    <title>Lihat Data Akun</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <div>
        <header>
            <div class="kontainer">
                <nav class="tombol">
                    <div class="logo">
                        <a href="index.html">
                            <img src="img/lgo.png" alt="logo">
                        </a>
                    </div>
                    <ul class="navigation">
                        <li><a href="akunSRC.html" class="button">Kembali ke Akun</a></li>
                    </ul>
                </nav>
            </div>
        </header>
    </div>
    <div class="bg">
        <div class="container">
            <h1>Data Akun</h1>
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
                            String password = resultSet.getString("password");
                            String email = resultSet.getString("email");
                            String phone_number = resultSet.getString("phone_number");
                            String gender = resultSet.getString("gender");
                            
                            out.println("<p>Username: " + username + "</p>");
                            out.println("<p>password: " + password + "</p>");
                            out.println("<p>Email: " + email + "</p>");
                            out.println("<p>Nomor HP: " + phone_number + "</p>");
                            out.println("<p>Gender: " + gender + "</p>");
                        } else {
                            out.println("Data akun tidak ditemukan.");
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
        </div>
    </div>
    <footer>
        <p>&copy; 2022 SRC Indonesia. All rights reserved by Ezi Punazi.</p>
    </footer>
</body>
</html>
