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
            String uname = (String) session.getAttribute("uid");
            if (request.getParameter("msg") != null) {%>
        <script>
            alert("Login Successfully");
        </script>  
        <%}
            if(request.getParameter("success")!=null)
            {%>
            <script>
                alert("Message Sent to Admin");
            </script>       
           <% }
             if(request.getParameter("failed")!=null)
            {%>
            <script>
                alert("Message Sending Failed");
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
                            <form action="view.jsp"  method="post" style="float: left;margin-left: 25px">
                                <label>Server Location :</label>
                                <select name="loc">
                                    <option value="India">India</option>
                                    <option value="USA">USA</option>
                                    <option value="UK">UK</option>
                                    <option value="CHINA">CHINA</option>
                                </select><br /><br />
                                <input type="submit" value="View" />
                            </form>
                        </center>
                        <div style="float: right;width: 400px;height: 400px">
                            <fieldset>
                                <LEGEND><b>Location And File Count</b></LEGEND>
                                <div style="float: left">
                                    <div style=" float: left;margin-left: -50px;margin-top: 10px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">India</label></center></div><br /><br /><br />
                                    <div style="float: next;margin-left: -50px;margin-top: 20px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">USA</label></center></div>
                                    <div style="float: next;margin-left: -50px;margin-top: 24px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">UK</label></center></div><br />
                                    <div style="float: next;margin-left: -50px;margin-top: 10px;border: 1px solid #0055D4;width: 100px;height: 20px;padding: 5px 10px;background-color: #000;border-radius: 5px"><center><label style="color: #fff">CHINA</label></center></div><br />
                                </div>
                                <%
                                    String loc1 = null, loc2 = null, loc3 = null, loc4 = null;
                                    Connection con = null;
                                    Statement st1 = null;
                                    Statement st2 = null;
                                    Statement st3 = null;
                                    Statement st4 = null;
                                    ResultSet rs1 = null;
                                    ResultSet rs2 = null;
                                    ResultSet rs3 = null;
                                    ResultSet rs4 = null;
                                    try {
                                        con = DbConnection.getConnection();
                                        st1 = con.createStatement();
                                        st2 = con.createStatement();
                                        st3 = con.createStatement();
                                        st4 = con.createStatement();
                                        /*Location 1*/
                                        rs1 = st1.executeQuery("select count(*) from loc1 ");
                                        if (rs1.next()) {
                                            loc1 = rs1.getString(1);
                                        }
                                        /*Location 2*/
                                        rs2 = st2.executeQuery("select count(*) from loc2 ");
                                        if (rs2.next()) {
                                            loc2 = rs2.getString(1);
                                        }
                                        /*Location 3*/
                                        rs3 = st3.executeQuery("select count(*) from loc3 ");
                                        if (rs3.next()) {
                                            loc3 = rs3.getString(1);
                                        }
                                        /*Location 4*/
                                        rs4 = st4.executeQuery("select count(*) from loc4 ");
                                        while (rs4.next()) {
                                            loc4 = rs4.getString(1);
                                        }
                                    } catch (Exception ex) {
                                        System.out.println("Exceptione Error in View " + ex);
                                    }
                                %>
                                <div>
                                    <center>
                                        <div><input type="text" value="<%=loc1%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: 10px;border-radius: 10px"/></div><br /><br />
                                        <div><input type="text" value="<%=loc2%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -10px;border-radius:10px"/></div><br /><br /><br />
                                        <div><input type="text" value="<%=loc3%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div><br /><br />
                                        <div><input type="text" value="<%=loc4%>" readonly="" style="border:1px solid #2a78f6;padding: 8px 10px;margin-top: -20px;border-radius: 10px"/></div><br /><br />
                                    </center>
                                </div>
                            </fieldset>
                        </div><br /><br /><br /><br /><br />
                        <table style="float: left;text-align: center;" border="1">
                            <tr>
                                <th width="50%">Id</th>
                                <th width="50%">File Name</th>
                            </tr>
                            <%
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
                    </div> 
                        <form action ="message.jsp" method="post" style="float: right;margin-top: 250px;margin-right: -250px">
                        <h1>Intimation to Admin</h1>
                        <p style="font-family: fantasy">Username</p>
                        <p><input type="text" value="<%=uname%>" readonly name="username" id="user" style="height:25px;width:220px;"/></p><br />
                        <p style="font-family: fantasy">Message</p>
                        <p><textarea cols="30" rows="5" name="info"></textarea></p><br /><br />
                        <p ><input type="submit" value="Submit" style="height:25px;width:100px;font-family: cursive" /> <input type="reset" value="Cancel" style="height:25px;width:100px;font-family: cursive" /></p>
                    </form>
                    <div class="cleaner">&nbsp;</div>
                </div>
                <div id="templatemo_footer">
                    <p>Copyright © 2015 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>