<%@page import="java.sql.Statement"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.sql.ResultSet"%>
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
            alert("File Deleted Successfully");
        </script>  
        <%}
            if (request.getParameter("msgg") != null) {%>
        <script>
            alert("File Deleted Failed");
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
                            <form action="cdelete.jsp"  method="post">
                                <h1>Delete File from Server</h1>
                                <label style="margin-left: -10px">Server Location</label>
                                <select name="loc" style="width: 100px">
                                    <option value="India">India</option>
                                    <option value="USA">USA</option>
                                    <option value="UK">UK</option>
                                    <option value="CHINA">CHINA</option>
                                </select>
                                <br /><br />
                                <label style="margin-left: 92px">File Name</label> <input type="text"  name="fname"   /><br /><br />
                                <input type="submit" value="Delete" />
                                <input type="reset" value="Reset" />
                            </form>
                        </center>
                    </div> 
                    <%
                        int c1=0;
                        String loc = request.getParameter("loc");
                        String fname = request.getParameter("fname");
                        try {
                            Connection con = null;
                            Statement st = null;
                            ResultSet rs = null;
                            con = DbConnection.getConnection();
                            st = con.createStatement();
                            if (loc.equals("India")) {
                                /*Location 1*/
                                rs = st.executeQuery("select ncount from chart_data where server='India'");
                                if (rs.next()) {
                                    c1=rs.getInt("ncount");
                                    c1 = c1-1;
                                }
                                st.executeUpdate("update chart_data set ncount='"+c1+"'where server='India'");
                                int i = st.executeUpdate("delete from loc1 where filename='" + fname + "'");
                                if (i != 0) {
                                    response.sendRedirect("cdelete.jsp?msg=success");
                                } else {
                                    response.sendRedirect("cdelete.jsp?msgg=failed");
                                }
                            }
                            if (loc.equals("USA")) {
                                /*Location 2*/
                                rs = st.executeQuery("select ncount from chart_data where server='USA'");
                                if (rs.next()) {
                                    c1=rs.getInt("ncount");
                                    c1 = c1-1;
                                }
                                st.executeUpdate("update chart_data set ncount='"+c1+"'where server='USA'");
                                int j = st.executeUpdate("delete from loc2 where filename='" + fname + "'");
                                if (j != 0) {
                                    response.sendRedirect("cdelete.jsp?msg=success");
                                } else {
                                    response.sendRedirect("cdelete.jsp?msgg=failed");
                                }
                            }
                            if (loc.equals("UK")) {
                                /*Location 3*/
                                rs = st.executeQuery("select ncount from chart_data where server='UK'");
                                if (rs.next()) {
                                    c1=rs.getInt("ncount");
                                    c1 = c1-1;
                                }
                                st.executeUpdate("update chart_data set ncount='"+c1+"'where server='UK'");
                                int k = st.executeUpdate("delete from loc3 where filename='" + fname + "'");
                                if (k != 0) {
                                    response.sendRedirect("cdelete.jsp?msg=success");
                                } else {
                                    response.sendRedirect("cdelete.jsp?msgg=failed");
                                }
                            }
                            if (loc.equals("CHINA")) {
                                /*Location 4*/
                                rs = st.executeQuery("select ncount from chart_data where server='CHINA'");
                                if (rs.next()) {
                                    c1=rs.getInt("ncount");
                                    c1 = c1-1;
                                }
                                st.executeUpdate("update chart_data set ncount='"+c1+"'where server='CHINA'");
                                int l = st.executeUpdate("delete from loc4 where filename='" + fname + "'");
                                if (l != 0) {
                                    response.sendRedirect("cdelete.jsp?msg=success");
                                } else {
                                    response.sendRedirect("cdelete.jsp?msgg=failed");
                                }
                            }

                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                    <div class="cleaner">&nbsp;</div>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright � 2017 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>