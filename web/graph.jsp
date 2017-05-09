<%@page import="org.jfree.chart.ChartUtilities"%>
<%@page import="java.io.File"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
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
                    <%
                        Connection conn = DbConnection.getConnection();
                        DefaultCategoryDataset my_bar_chart_dataset = new DefaultCategoryDataset();
                        Statement stmt = conn.createStatement();
                        try {
                            ResultSet query_set = stmt.executeQuery("select server,ncount from chart_data");
                            while (query_set.next()) {
                                String category = query_set.getString("server");
                                int marks = query_set.getInt("ncount");
                                my_bar_chart_dataset.addValue(marks, "Files", category);
                            }
                            JFreeChart BarChartObject = ChartFactory.createBarChart("Server Vs Files - Bar Chart", "Server", "Files", my_bar_chart_dataset, PlotOrientation.VERTICAL, true, true, false);
                            query_set.close();
                            stmt.close();
                            conn.close();
                            int width = 640; /* Width of the image */
                            int height = 480; /* Height of the image */
                            File BarChart = new File("C:/Users/JP9/Documents/NetBeansProjects/MultiCopy/web/images/output_chart.png");
                            ChartUtilities.saveChartAsPNG(BarChart, BarChartObject, width, height);
                        } catch (Exception i) {
                            System.out.println(i);
                        }
                    %>
                    <div class="section_01_left">
                        <center><img src="images/output_chart.png" WIDTH="600"  HEIGHT="400" BORDER="0" USEMAP="#chart" /></center> 
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