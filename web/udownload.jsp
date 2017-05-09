<%@page import="java.nio.charset.Charset"%>
<%@page import="com.multi.action.TrippleDes"%>
<%@page import="javax.swing.JOptionPane"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <title> Provable Multicopy Dynamic Data Possession in Cloud Computing Systems</title>
        <meta name="keywords" content="VOIP Company, css template, free web design layout" />
        <meta name="description" content="VOIP Company, css template, free web design layout from TemplateMo.com" />
        <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
        <link rel="stylesheet" type="text/css" href="css/tabcontent.css"/>
        <link rel="icon" type="image/ico" href="images/kk.ico" />
    </head>
    <body><br />
        <%
            String uname = (String) session.getAttribute("uid");
            if (request.getParameter("msg") != null) {%>
        <script>
            alert("Login Successfully");
        </script>  
        <%}
        %>
        <div id="templatemo_container">
            <div id="templatemo_menu">
                <div class="indentmenu">
                    <ul>
                        <li><a href="uhome.jsp" rel="tab1" class="selected">Home</a></li>
                        <li><a href="uview.jsp" rel="tab2">View</a></li>
                        <li><a href="udownload.jsp" rel="tab3">Download</a></li>
                        <li><a href="index.jsp" rel="tab4">Logout</a></li>
                    </ul>
                    <center><h3 style="margin-top: 10px">Welcome </h3><label style="color: #009dff"><%=uname%></label></center>
                </div>
            </div> <!-- end of mneu -->
            <div id="templatemo_banner"><br /><br />
            </div>
            <div id="templatemo_content">
                <div id="content_top"></div>
                <div class="templatemo_content_section_01">
                    <div class="section_01_left">
                        <center>
                            <form action="udownload.jsp"  method="post">
                                <label style="margin-left: 120px">File Name</label><input type="text"  name="fname" id="fname" style="margin-left: 8px" /><br /><br />
                                <label style="margin-left: 92px">Decrypted Key</label> <input type="text"  name="key"   /><br /><br />
                                <input type="submit" value="Download" />
                                <input type="reset" value="Reset" />
                            </form>
                        </center>
                    </div> 
                    <%
                        String x = null;
                        String fname = request.getParameter("fname");
                        String dkey = request.getParameter("key");
                        Connection con = null;
                        Statement st = null;
                        ResultSet rs = null;
                        ResultSet rs1 = null;
                        if (fname != null) {
                            con = DbConnection.getConnection();
                            st = con.createStatement();

                            try {
                                rs1 = st.executeQuery("select * from request where username='" + uname + "' AND filename='" + fname + "' AND pkey='" + dkey + "'");
                                if (rs1.next()) {
                                    rs = st.executeQuery("select filename, type, content,dcipher from documents where filename ='" + fname + "'");
                                    if (rs.next()) {
                                        x = new TrippleDes().decrypt(rs.getString("dcipher"));
                                    }
                                    if (rs.getString(2) == ".txt") {
                                        response.setContentType("application/octet-stream");
                                    } else if (rs.getString(2) == ".pdf") {
                                        response.setContentType("application/pdf");
                                    } else if ((rs.getString(2) == ".doc") || rs.getString(2) == ".docx") {
                                        response.setContentType("application/msword");
                                    }
                                    response.addHeader("Content-Disposition", "attachment; filename=" + rs.getString(1));
//                                    Blob blb = rs.getBlob(3);
//                                    byte[] bdata = blb.getBytes(1, (int) blb.length());
                                    byte[] bdata = x.getBytes();
                                    byte[] b = x.getBytes(Charset.forName("UTF-8"));
                                    OutputStream output = response.getOutputStream();
                                    output.write(bdata);
                                    output.close();
                                    rs.close();
                                    DbConnection.getConnection().close();
                                } else {
                                    response.sendRedirect("udownload.jsp?msgg=Failed");
                                }
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        }
                    %>
                    <div class="cleaner">&nbsp;</div>
                    <%
                        if (request.getParameter("msgg") != null) {
                    %>
                    <script>alert('Please Enter Correct Public Key');</script>
                    <%
                        }
                    %>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright © 2017 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>