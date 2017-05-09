<%@page import="com.multi.action.TrippleDes"%>
<%@page import="com.multi.action.Ftpcon"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    String fname = request.getParameter("filename");
    System.out.println("File Name " + fname);
    String a = request.getParameter("modify");
    out.println("Content " + a);
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    String x = new TrippleDes().encrypt(a);
    /*Cloud Start*/
    File f = new File(fname);
    FileWriter fw = new FileWriter(f);
    fw.write(x);
    fw.close();
    Ftpcon ftpcon = new Ftpcon();
    ftpcon.upload(f);
    /*Cloud End*/
    int i = st.executeUpdate("update documents set  dcipher='" + x + "' where filename='" + fname + "'");
    int i1 = st.executeUpdate("update loc1 set  cipher='" + x + "' where filename='" + fname + "'");
    int i2 = st.executeUpdate("update loc2 set  cipher='" + x + "' where filename='" + fname + "'");
    int i3 = st.executeUpdate("update loc3 set  cipher='" + x + "' where filename='" + fname + "'");
    int i4 = st.executeUpdate("update loc4 set  cipher='" + x + "' where filename='" + fname + "'");
    if (i != 0) {
        response.sendRedirect("modify.jsp?Modified");
    } else {
        response.sendRedirect("modify.jsp?Error in Modify data");
    }

%>