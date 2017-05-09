<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Statement"%>
<%
    String uname = request.getParameter("username");
    String msg = request.getParameter("info");
    Connection con = null;
    Statement st = null;
    try{
        con = DbConnection.getConnection();
        st = con.createStatement();
        int i = st.executeUpdate("insert into message(oname, message)values('"+uname+"','"+msg+"')");
        if(i!=0)
        {
            response.sendRedirect("view.jsp?success");
        }
        else
        {
            response.sendRedirect("view.jsp?failed");
        }
    }
    catch(Exception e)
    {
        e.printStackTrace();
    }
%>