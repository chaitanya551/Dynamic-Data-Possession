<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.multi.database.DbConnection"%>
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
                            <table border="1">
                                <tr>
                                    <th>Name</th>
                                    <th>Message</th>
                                </tr>
                                <tr>
                                    <%
                                        try {
                                            Connection con = DbConnection.getConnection();
                                            Statement st = con.createStatement();
                                            ResultSet rs = st.executeQuery("select * from message");
                                            while (rs.next()) {%>
                                    <td><%=rs.getString("oname")%></td>
                                    <td><%=rs.getString("message")%></td>
                                    <%}
                                        } catch (Exception e) {
                                            e.printStackTrace();
                                        }
                                    %>

                                </tr>
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