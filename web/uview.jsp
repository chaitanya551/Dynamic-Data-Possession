<%@page import="java.sql.ResultSet"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
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
                            <h1>File Details</h1>
                            <table border="1"style="text-align: center">
                                <tr>
                                    <th>File Name</th>
                                    <th>Uploaded By</th>
                                    <th>Request</th>
                                </tr>
                                    <%
                                        String fname = null, owner = null;
                                        String mail = (String) session.getAttribute("umail");
                                        Connection con = null;
                                        Statement st = null;
                                        ResultSet rs = null;
                                        try {
                                            con = DbConnection.getConnection();
                                            st = con.createStatement();
                                            rs = st.executeQuery("select * from documents");
                                            while (rs.next()) {
                                                fname = rs.getString("filename").trim();
                                                owner = rs.getString("upload_by").trim();
                                    %>
                                     <tr>
                                    <td><%=rs.getString("filename")%></td>
                                    <td><%=rs.getString("upload_by")%></td>
                                    <td><a href="uview.jsp?<%=fname%>,<%=uname%>,<%=mail%>,<%=owner%>"><button>Request Sent</button></a></td>
                                    <%
                                            }
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
                            int i = st.executeUpdate("insert into request(filename, username, mailid, owner, status,pkey) values('" + data[0] + "','" + data[1] + "','" + data[2] + "','" + data[3] + "','No','Not_Generated')");
                            if (i != 0) {
                                response.sendRedirect("uview.jsp?Request_Sent_Successfully");
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