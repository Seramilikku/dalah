<%-- 
    Document   : hapusakunSRC
    Created on : Jul 14, 2023, 2:59:23 PM
    Author     : user
--%>
<%@ page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<%
    String username = (String) session.getAttribute("username");

    if (username != null) {
        String confirm = request.getParameter("confirm");

        if (confirm != null && confirm.equals("yes")) {
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/uascall_srcadmin","uascall_usrcami","AMYqcn7vNSRw");
                String query = "DELETE FROM daftarsrc WHERE username=?";
                PreparedStatement statement = connection.prepareStatement(query);
                statement.setString(1, username);
                int deletedQuery = statement.executeUpdate();
                statement.close();
                connection.close();

                if (deletedQuery > 0) {
                    session.invalidate();
                    response.sendRedirect("loginSRC.html");
                } else {
                    out.println("Gagal menghapus akun.");
                }
            } catch (Exception e) {
                out.println(e.getMessage());
            }
        } else if (confirm != null && confirm.equals("no")) {
            response.sendRedirect("akunSRC.html");
        } else {
            %>
            <!DOCTYPE html>
            <html lang="id">
            <head>
                <meta charset="utf-8">
                <title>Konfirmasi Hapus Akun</title>
                <link rel="stylesheet" href="style.css">
            </head>
            <body>
                <div class="bg">
                <div class="container">
                    <h1>Konfirmasi Hapus Akun</h1>
                    <p>Anda yakin ingin menghapus akun?</p>
                    <form method="post" action="hapusakunSRC.jsp">
                        <input type="hidden" name="confirm" value="yes">
                        <button type="submit">Ya</button>
                    </form>
                    <form method="post" action="hapusakunSRC.jsp">
                        <input type="hidden" name="confirm" value="no">
                        <button type="submit">Tidak</button>
                    </form>
                </div>
                </div>
            </body>
            </html>
            <%
        }
    } else {
        response.sendRedirect("loginSRC.html");
    }
%>
