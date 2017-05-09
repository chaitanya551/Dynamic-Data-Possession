<%@page import="com.multi.action.Mail"%>
<%@page import="java.util.Random"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
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
                        <li><a href="ownerhome.jsp" rel="tab1" class="selected">Home</a></li>
                        <li><a href="urequest.jsp" rel="tab2" >Request</a></li>
                        <li><a href="upload.jsp" rel="tab3">Upload</a></li>
                        <li><a href="view.jsp" rel="tab4">View</a></li>
                        <li><a href="modify.jsp" rel="tab5">Modify</a></li>
                        <li><a href="download.jsp" rel="tab6">Download</a></li>
                        <li><a href="index.jsp" rel="tab7">Logout</a></li>
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
                            <table border="1" style="text-align: center">
                                <tr>
                                    <th>File Name</th>
                                    <th>User Name</th>
                                    <th>User Mail</th>
                                    <th>Key </th>
                                    <th>Action</th>
                                </tr><tr>
                                    <%
                                        Random r = new Random();
                                        int ii = r.nextInt(100000 - 50000) + 50000;
                                        String k = ii + "";
                                        Connection con = null;
                                        Statement st = null;
                                        ResultSet rs = null;
                                        try {
                                            con = DbConnection.getConnection();
                                            st = con.createStatement();
                                            rs = st.executeQuery("select * from request where owner='" + uname + "' AND status='No  '");
                                            while (rs.next()) {%>
                                    <td><%=rs.getString("filename")%></td>
                                    <td><%=rs.getString("username")%></td>
                                    <td><%=rs.getString("mailid")%></td>
                                    <td><%=rs.getString("pkey")%></td>
                                    <td><a href="urequest.jsp?<%=rs.getString("filename")%>,<%=rs.getString("username")%>,<%=rs.getString("mailid")%>,<%=uname%>,<%=k%>"><button>Response</button></a></td>
                                    <%}
                                        } catch (Exception ex) {
                                            ex.printStackTrace();
                                        }
                                    %>
                                </tr>
                            </table>
                        </center> 
                    </div> 
                    <%
                        try {
                            String[] data = request.getQueryString().split(",");
                            String msg = "File Name :" + data[0] + " Key :" + data[4];
                            int i = st.executeUpdate("update  request set status='Yes', pkey='" + data[4] + "' where filename='" + data[0] + "' AND username='" + data[1] + "' AND owner='" + data[3] + "'");
                            if (i != 0) {
                                Mail.sendMail(msg, data[1], data[2]);
                                response.sendRedirect("urequest.jsp?Response_Send_Successfully");
                            }
                        } catch (Exception ex) {
                            ex.printStackTrace();
                        }
                    %>
                    <div class="cleaner">&nbsp;</div>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright © 2017 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>