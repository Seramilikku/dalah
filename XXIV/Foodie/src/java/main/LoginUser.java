/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package main;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Ezi Punazi
 */
public class LoginUser extends HttpServlet {
    
    @Override
    protected void doGet (
            HttpServletRequest request,
            HttpServletResponse response
    ) throws IOException, ServletException {
        
        String userName = request.getParameter ("userName");
        
        response.setContentType("text/html; charset=UTF-8");
        
        PrintWriter out = response.getWriter();
        out.println(userName);
        out.close();
    }

}
