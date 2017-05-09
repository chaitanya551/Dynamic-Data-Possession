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
        <script>
            function Checked()
            {
                if((document.getElementById("user").value)=="")
                {
                    alert("Please Enter Username");
                    document.getElementById("user").focus();
                    return false;
                }
                if((document.getElementById('pass').value)=="")
                {
                    alert("Please Enter Password");
                    document.getElementById('pass').focus();
                    return false;
                }
                    
            }
        </script>
    </head>
    <body><br />
        <%
            if(request.getParameter("msgg")!=null)
            {%>
            <script>alert('Login Failed');</script>
            <%}
        %>
        <div id="templatemo_container">
            <div id="templatemo_menu">
                <div class="indentmenu">
                    <ul>
                        <li><a href="abstract.jsp" rel="tab1">Abstract</a></li>
                        <li><a href="index.jsp" rel="tab2" class="selected">Home</a></li>
                        <li><a href="cloud.jsp" rel="tab3">Cloud Server</a></li>
                        <li><a href="owner.jsp" rel="tab4">Owner</a></li>
                        <li><a href="user.jsp" rel="tab5">User</a></li>
                        <li><a href="register.jsp" rel="tab6">Registration</a></li>
                    </ul>
                </div>
            </div> <!-- end of mneu -->
            <div id="templatemo_banner"><br /><br />
            </div>
            <div id="templatemo_content">
                <div id="content_top"></div>
                <div class="templatemo_content_section_01">
                    <div class="section_01_left">
                        <form action ="caction.jsp" method="post" onsubmit="return Checked();" style="margin-left: 150px;float: left">
                            <p style="font-family: fantasy">Username</p>
                            <p><input type="text" onpaste="return false;" name="username" id="user" style="height:25px;width:220px;"/></p>
                            <p style="font-family: fantasy">Password</p>
                            <p><input type="password" onpaste="return false;" name="password" id="pass" style="height:25px;width:220px" /></p>
                            <p></p>
                            <p ><input type="submit" value="Submit" style="height:25px;width:100px;font-family: cursive" /> <input type="reset" value="Cancel" style="height:25px;width:100px;font-family: cursive" /></p>
                        </form>
                        <h2 style="margin-left: 600px">Cloud Server</h2>
                        <img src="images/cloud.png" width="400px" height="200px;" style="float: right;background: transparent"></img>
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