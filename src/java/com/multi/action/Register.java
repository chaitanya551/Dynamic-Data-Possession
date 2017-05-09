/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.multi.action;

import com.multi.database.DbConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JP9
 */
public class Register extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
                String name = request.getParameter("user").trim();
                String uname = request.getParameter("userid");
                String pass = request.getParameter("pass");
                String email = request.getParameter("email");
                String dob = request.getParameter("dob");
                String gen = request.getParameter("gender");
                String role = request.getParameter("role");
                String mob = request.getParameter("mob");
                String loc = request.getParameter("loc");
                Connection con = DbConnection.getConnection();
                PreparedStatement ps = con.prepareStatement("insert into register values (?,?,?,?,?,?,?,?,?)");
                ps.setString(1, name);
                ps.setString(2, uname);
                ps.setString(3, pass);
                ps.setString(4, email);
                ps.setString(5, dob);
                ps.setString(6, gen);
                ps.setString(7, role);
                ps.setString(8, mob);
                ps.setString(9, loc);
                int i = ps.executeUpdate();
                if(i!=0)
                {
                    response.sendRedirect("register.jsp?msg=success");
                }
                else
                {
                    response.sendRedirect("register.jsp?msgg=failed");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
