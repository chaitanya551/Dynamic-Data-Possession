<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String verify ="Cloud";
    String uname = request.getParameter("username");
    String pwd = request.getParameter("password");
    try{
        if(uname.equals(verify)&&pwd.equals(verify))
        {
           response.sendRedirect("chome.jsp?");
        }
        else
        {
            response.sendRedirect("cloud.jsp?msgg=failed");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }

%>