/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.multi.action;

import com.multi.database.DbConnection;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author JP9
 */
public class Upload extends HttpServlet {

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
            Connection con;
            ResultSet rs = null;
            Statement st6 = null;
            PreparedStatement pstm = null;
            String subject = "";
            String cd = "";
            String uname = (String) request.getSession().getAttribute("uid");
            System.out.println("User Name" + uname);
            try {
                boolean isMultipartContent = ServletFileUpload.isMultipartContent(request);
                if (!isMultipartContent) {
                    return;
                }
                FileItemFactory factory = new DiskFileItemFactory();
                ServletFileUpload upload = new ServletFileUpload(factory);
                try {
                    List<FileItem> fields = upload.parseRequest(request);
                    Iterator<FileItem> it = fields.iterator();
                    if (!it.hasNext()) {

                        return;
                    }
                    while (it.hasNext()) {
                        FileItem fileItem = it.next();
                        boolean isFormField = fileItem.isFormField();
                        if (isFormField) {
                        } else {
                            try {
                                con = DbConnection.getConnection();
                                /*Insert Query*/
                                String st = "insert into documents(filename, type, content, upload_by, location, dcipher) values (?,?,?,?,?,?)";
                                String st1 = "insert into loc1(filename, type, content, upload_by, location, cipher) values (?,?,?,?,?,?)";
                                String st2 = "insert into loc2(filename, type, content, upload_by, location, cipher) values (?,?,?,?,?,?)";
                                String st3 = "insert into loc3(filename, type, content, upload_by, location, cipher) values (?,?,?,?,?,?)";
                                String st4 = "insert into loc4(filename, type, content, upload_by, location, cipher) values (?,?,?,?,?,?)";
                                /*Prepare Statement*/
                                PreparedStatement psmt = DbConnection.getConnection().prepareStatement(st);
                                PreparedStatement psmt1 = DbConnection.getConnection().prepareStatement(st1);
                                PreparedStatement psmt2 = DbConnection.getConnection().prepareStatement(st2);
                                PreparedStatement psmt3 = DbConnection.getConnection().prepareStatement(st3);
                                PreparedStatement psmt4 = DbConnection.getConnection().prepareStatement(st4);
                                /*Start*/
                                String encryptedText = getStringFromInputStream(fileItem.getInputStream());
                                String cipher = new TrippleDes().encrypt(encryptedText);
                                System.out.println(encryptedText);
                                String fileExtesion = fileItem.getName().substring(fileItem.getName().lastIndexOf('.'));
                                System.out.println("File Extension" + fileExtesion);
                                boolean fileAllowed = fileExtesion.equalsIgnoreCase(".txt")
                                        || fileExtesion.equalsIgnoreCase(".pdf")
                                        || fileExtesion.equalsIgnoreCase(".doc")
                                        || fileExtesion.equalsIgnoreCase(".docx");

                                if (((fileItem.getInputStream()) != null) && fileAllowed) {

                                    try {
                                        /*Location 0*/
                                        psmt.setString(1, fileItem.getName());
                                        psmt.setString(2, fileExtesion);
                                        psmt.setBinaryStream(3, fileItem.getInputStream());
                                        psmt.setString(4, uname);        // pass the user name or id 
                                        psmt.setString(5, "India");
                                        psmt.setString(6, cipher);
                                        int sss = psmt.executeUpdate();
                                        /*Location 1*/
                                        psmt1.setString(1, fileItem.getName());
                                        psmt1.setString(2, fileExtesion);
                                        psmt1.setBinaryStream(3, fileItem.getInputStream());
                                        psmt1.setString(4, uname);        // pass the user name or id 
                                        psmt1.setString(5, "India");
                                        psmt1.setString(6, cipher);
                                        int sss1 = psmt1.executeUpdate();
                                        /*Location 2*/
                                        psmt2.setString(1, fileItem.getName());
                                        psmt2.setString(2, fileExtesion);
                                        psmt2.setBinaryStream(3, fileItem.getInputStream());
                                        psmt2.setString(4, uname);// pass the user name or id 
                                        psmt2.setString(5, "USA");
                                        psmt2.setString(6, cipher);
                                        int sss2 = psmt2.executeUpdate();
                                        /*Location 3*/
                                        psmt3.setString(1, fileItem.getName());
                                        psmt3.setString(2, fileExtesion);
                                        psmt3.setBinaryStream(3, fileItem.getInputStream());
                                        psmt3.setString(4, uname); // pass the user name or id
                                        psmt3.setString(5, "UK");
                                        psmt3.setString(6, cipher);
                                        int sss3 = psmt3.executeUpdate();
                                        /*Location 4*/
                                        psmt4.setString(1, fileItem.getName());
                                        psmt4.setString(2, fileExtesion);
                                        psmt4.setBinaryStream(3, fileItem.getInputStream());
                                        psmt4.setString(4, uname); // pass the user name or id 
                                        psmt4.setString(5, "CHINA");
                                        psmt4.setString(6, cipher);
                                        int sss4 = psmt4.executeUpdate();
                                        /*Cloud Start*/
                                        File f = new File(fileItem.getName());
                                        try (FileWriter fw = new FileWriter(f)) {
                                            fw.write(cipher);
                                        }
                                        Ftpcon ftpcon = new Ftpcon();
                                        ftpcon.upload(f);
                                        /*Cloud End*/
                                        if (sss1 == 1 && sss2 == 1 && sss3 == 1 && sss4 == 1) {
                                            /*Count Start*/
                                            int s1, s2, s3, s4 = 0;
                                            con = DbConnection.getConnection();
                                            st6 = con.createStatement();
                                            rs = st6.executeQuery("select ncount from chart_data where server='India' ");
                                            if (rs.next()) {
                                                s1 = rs.getInt("ncount");
                                                s1 = s1 + 1;
                                                st6.executeUpdate("update chart_data set ncount='" + s1 + "' where server='India'");
                                            }
                                            rs = st6.executeQuery("select ncount from chart_data where server='USA' ");
                                            if (rs.next()) {
                                                s2 = rs.getInt("ncount");
                                                s2 = s2 + 1;
                                                st6.executeUpdate("update chart_data set ncount='" + s2 + "' where server='USA'");
                                            }
                                            rs = st6.executeQuery("select ncount from chart_data where server='UK' ");
                                            if (rs.next()) {
                                                s3 = rs.getInt("ncount");
                                                s3 = s3 + 1;
                                                st6.executeUpdate("update chart_data set ncount='" + s3 + "' where server='UK'");
                                            }
                                            rs = st6.executeQuery("select ncount from chart_data where server='CHINA' ");
                                            if (rs.next()) {
                                                s4 = rs.getInt("ncount");
                                                s4 = s4 + 1;
                                                st6.executeUpdate("update chart_data set ncount='" + s4 + "' where server='CHINA'");
                                            }
                                            /*Count End*/
                                            response.sendRedirect("upload.jsp?msg= sucess..!");
                                        } else {
                                            response.sendRedirect("upload.jsp?msgg= NOT sucess..!");
                                        }
                                        con.close();

                                    } catch (SQLException | IOException e) {
                                        out.print("Failed due to " + e);
                                    } finally {
                                        // next statement is must otherwise file will not be deleted from the temp as fin using f.
                                        // its necessary to put outside otherwise at the time of exception file will not be closed.
                                    }
                                } else {
                                    out.print("Please select the correct file...");
                                }// end of if and else
                            } catch (Exception e) {
                                out.println(e.toString());
                            }
                        }

                    }
                } catch (FileUploadException e) {
                    e.printStackTrace();
                } catch (Exception ex) {
                    Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
                }
            } finally {
                out.close();
            }

        }
    }

    private static String getStringFromInputStream(InputStream is) {

        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();

        String line;
        try {

            br = new BufferedReader(new InputStreamReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sb.toString();

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
