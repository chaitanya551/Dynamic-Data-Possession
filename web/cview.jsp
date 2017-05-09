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
                        <li><a href="chome.jsp" rel="tab1" class="selected">Home</a></li>
                        <li><a href="mview.jsp" rel="tab2">Message</a></li>
                        <li><a href="cview.jsp" rel="tab3">View</a></li>
                        <li><a href="cdelete.jsp" rel="tab4">File Action</a></li>
                        <li><a href="graph.jsp" rel="tab5">Graph</a></li>
                        <li><a href="index.jsp" rel="tab6">Logout</a></li>
                    </ul>
                    <center><h3 style="margin-top: 10px">Welcome </h3><label style="color: #009dff">Admin</label></center>
                </div>
            </div> <!-- end of mneu -->
            <div id="templatemo_banner"><br /><br />
            </div>
            <div id="templatemo_content">
                <div id="content_top"></div>
                <div class="templatemo_content_section_01">
                    <div class="section_01_left">
                        <center>
                            <form action="cview.jsp"  method="post">
                                <label>Server Location :</label>
                                <select name="loc">
                                    <option value="India">India</option>
                                    <option value="USA">USA</option>
                                    <option value="UK">UK</option>
                                    <option value="CHINA">CHINA</option>
                                </select><br /><br />
                                <input type="submit" value="View" />
                            </form><br /><br /><br /><br />
                        <table style="text-align: center;" border="1">
                            <tr>
                                <th width="50%">Id</th>
                                <th width="50%">File Name</th>
                            </tr>
                            <%
                                Connection con = null;
                                Statement st1 = null;
                                Statement st2 = null;
                                Statement st3 = null;
                                Statement st4 = null;
                                ResultSet rs1 = null;
                                ResultSet rs2 = null;
                                ResultSet rs3 = null;
                                ResultSet rs4 = null;
                                String loc = request.getParameter("loc");
                                try {
                                    con = DbConnection.getConnection();
                                    st1 = con.createStatement();
                                    st2 = con.createStatement();
                                    st3 = con.createStatement();
                                    st4 = con.createStatement();
                                    /*Location 1*/
                                    rs1 = st1.executeQuery("select * from loc1 where location='" + loc + "'");
                                    while (rs1.next()) {%>
                            <tr>
                                <td><%=rs1.getString("doc_id")%></td>
                                <td><%=rs1.getString("filename")%></td>
                            </tr>
                            <% }
                                /*Location 2*/
                                rs2 = st2.executeQuery("select * from loc2 where location='" + loc + "'");
                                while (rs2.next()) {%>
                            <tr>
                                <td><%=rs2.getString("doc_id")%></td>
                                <td><%=rs2.getString("filename")%></td>
                            </tr>
                            <%}
                                /*Location 3*/
                                rs3 = st3.executeQuery("select * from loc3 where location='" + loc + "'");
                                while (rs3.next()) {%>
                            <tr>
                                <td><%=rs3.getString("doc_id")%></td>
                                <td><%=rs3.getString("filename")%></td>
                            </tr>
                            <%}
                                /*Location 4*/
                                rs4 = st4.executeQuery("select * from loc4 where location='" + loc + "'");
                                while (rs4.next()) {%>
                            <tr>
                                <td><%=rs4.getString("doc_id")%></td>
                                <td><%=rs4.getString("filename")%></td>
                            </tr>
                            <% }
                                } catch (Exception ex) {
                                    System.out.println("Exceptione Error in View " + ex);
                                }
                            %>
                        </table>
                        </center>
                    </div> 
                    <div class="cleaner">&nbsp;</div>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright © 2017 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>