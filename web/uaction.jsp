<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.database.DbConnection"%>
<%
    String uname = request.getParameter("username");
    String pass = request.getParameter("password");
    String role ="User";
    try{
        Connection con = DbConnection.getConnection();
        Statement st = con.createStatement();
        ResultSet rs = st.executeQuery("select * from register where uname='"+uname+"' AND pass='"+pass+"' AND role='"+role+"' ");
        if(rs.next())
        {
            session.setAttribute("umail", rs.getString("email"));
            session.setAttribute("uid", rs.getString("name"));
            response.sendRedirect("uhome.jsp?msg=success");
        }
        else
        {
            response.sendRedirect("user.jsp?msgg=failed");
        }
    }
    catch(Exception ex)
    {
        ex.printStackTrace();
    }

%>