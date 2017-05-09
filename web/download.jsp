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
            String uname = (String)session.getAttribute("uid");
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
                            <form action="downloadfile.jsp"  method="post">
                                <label style="margin-left: 65px">File Name</label> <input type="text"  name="fname" id="fname"  /><br /><br />
                                <input type="submit" value="Download" />
                                <input type="reset" value="Reset" />
                            </form>
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