<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.multi.database.DbConnection"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
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
                        <li><a href="upload.jsp" rel="tab2">Upload</a></li>
                        <li><a href="view.jsp" rel="tab3">View</a></li>
                        <li><a href="#" rel="tab4">Modify</a></li>
                        <li><a href="download.jsp" rel="tab5">Download</a></li>
                        <li><a href="index.jsp" rel="tab6">Logout</a></li>
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
                        <center> <table border="1">
                                <tr><th>Files</th></tr>
                                <tr>
                                    <%
                                        Connection con = null;
                                        Statement st1 = null;
                                        Statement st2 = null;
                                        Statement st3 = null;
                                        Statement st4 = null;
                                        ResultSet rs1 =null;
                                        ResultSet rs2 =null;
                                        ResultSet rs3 =null;
                                        ResultSet rs4 =null;
                                        String loc = request.getParameter("loc");
                                        System.out.println("Location "+loc);
                                        try {
                                            if(loc.equals("USA"))
                                            {
                                                st1 = con.createStatement();
                                                rs1 = st1.executeQuery("select * from loc1 where loc='"+loc+"'");
                                                while(rs1.next())
                                                {
                                                    System.out.println("File Name "+rs1.getString("filename"));
                                                }
                                            }
                                        } catch (Exception e) {
                                            System.out.println("Exception in View " + e);
                                        } finally {
                                            if (st1 != null && st2 != null && st3 != null && st4 != null) {
                                                st1.close();
                                                st2.close();
                                                st3.close();
                                                st4.close();
                                            }
                                            if (con != null) {
                                                con.close();
                                            }
                                        }
                                    %>
                                </tr>
                            </table>
                        </center>
                    </div> 
                    <div class="cleaner">&nbsp;</div>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright © 2015 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>