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
            function checked() {

                var us = document.getElementById("user").value;
                var pa = document.getElementById("userid").value;
                var gr = document.getElementById("pass").value;
                var em = document.getElementById("email").value;
                var mo = document.getElementById("mob").value;
                var pl = document.getElementById("loc").value;
                var filter = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                var mob = /^[1-9]{1}[0-9]{10}$/;

                if (us == "") {
                    alert("Enter Name");
                    document.getElementById("user").value;
                    return false;
                }
                if (pa == "") {
                    alert("Enter Username");
                    document.getElementById("userid").value;
                    return false;
                }
                if (gr == "") {
                    alert("Enter Password");
                    document.getElementById("pass").value;
                    return false;
                }
                if (em == "") {
                    alert("Enter Email");
                    document.getElementById("email").value;
                    return false;
                }
                if (!filter.test(email.value)) {
                    alert('Please provide a valid email address');
                    email.focus;
                    return false;
                }
                if (mo == "") {
                    alert("Enter Mobile");
                    document.getElementById("mob").value;
                    return false;
                }
                if (isNaN(mo))
                {
                    alert("Enter Numbers Only");
                    document.getElementById("mob").value;
                    return false;
                }
                if (!/^[0-9]{10}$/.test(mo)) {
                    alert("Please input exactly 10 numbers!");
                    document.getElementById("mob").value;
                    return false;
                }

                if (pl == "") {
                    alert("Enter Location");
                    document.getElementById("loc").value;
                    return false;
                }
            }
        </script>
    </head>
    <body><br />
        <div id="templatemo_container">
            <div id="templatemo_menu">
                <div class="indentmenu">
                    <ul>
                        <li><a href="index.jsp" rel="tab1" class="selected">Home</a></li>
                        <li><a href="user.jsp" rel="tab2">User Login</a></li>
                        <li><a href="owner.jsp" rel="tab3">Owner Login</a></li>
                    </ul>
                </div>
            </div> <!-- end of mneu -->
            <div id="templatemo_banner"><br /><br />
            </div>
            <div id="templatemo_content">
                <div id="content_top"></div>
                <div class="templatemo_content_section_01">
                    <div class="section_01_left">
                        <form action="Register" method="post" onsubmit="return checked();" style="margin-left: 200px">
                                <p style="font-family:fantasy;font-size:350%; margin-left: -200px;">Registration</p><br></br>
                                <p style="font-family:fantasy;font-size:150%;margin-left: 33px">Name : <input type ="text" name ="user" id="user" size="30"/></p>
                                <p style="font-family:fantasy;font-size:150%; ">Username : <input type ="text" name ="userid" id="userid" size="30"/></p>
                                <p style="font-family:fantasy;font-size:150%;margin-left: 3px; ">Password : <input type ="password"  name ="pass" id="pass" size="30"/></p>	
                                <p style="font-family:fantasy;font-size:150%;margin-left: 10px; ">Email_ID : <input type ="email"  name ="email" id="email" size="30"/></p>	
                                <p style="font-family:fantasy;font-size:150%;margin-left: -17px; ">Date Of Birth : <input type ="date" name ="dob" id="dob" size="30"/></p>	
                                <p style="font-family:fantasy;font-size:150%;margin-left: 20px; ">Gender : <select name="gender">
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </p>	
                                <p style="font-family:fantasy;font-size:150%;margin-left: 40px; ">Role : <select name="role">
                                        <option value="Owner">Owner</option>
                                        <option value="User">User</option>
                                    </select>
                                </p>
                                <p style="font-family:fantasy;font-size:150%;margin-left: 23px; ">  Mobile : <input type ="text" name ="mob" id="mob" size="30"/></p>	
                                <p style="font-family:fantasy;font-size:150%;margin-left: 10px; ">  Location : <input type ="text" name ="loc" id="loc" size="30"/></p>	<br />
                                <p style="margin-left: 50px;"><input type ="submit" value="Register" style="font-size:150%;"/>&nbsp;&nbsp;<input type ="reset" value="Cancel" style="font-size:150%;" /></p>
                            </form>
                    </div> 
                    <div class="cleaner">&nbsp;</div>
                </div>
                <%
                    if(request.getParameter("msg")!=null)
                    {%>
                    <script>alert("Registration Successfully");</script>
                    <%}
                    if(request.getParameter("msgg")!=null)
                    {%>
                    <script>alert("Registration Failed");</script>
                    <%}
                %>
                <div id="templatemo_footer">
                    <p>Copyright © 2015 </p>
                </div> <!-- end of footer -->
            </div>
        </div>
    </body>
</html>