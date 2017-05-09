<%@page import="java.nio.charset.Charset"%>
<%@page import="com.multi.action.TrippleDes"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%
    String x = null;
    String fname = request.getParameter("fname");
    Connection con = DbConnection.getConnection();
    Statement st = con.createStatement();
    ResultSet rs = st.executeQuery("select filename, type, dcipher from documents where filename ='" + fname + "'");
    if (rs.next()) {
        x = new TrippleDes().decrypt(rs.getString("dcipher"));
    }
    response.reset();
    if (rs.getString(2) == ".txt") {
        response.setContentType("application/octet-stream");
    } else if (rs.getString(2) == ".pdf") {
        response.setContentType("application/pdf");
    } else if ((rs.getString(2) == ".doc") || rs.getString(2) == ".docx") {
        response.setContentType("application/msword");
    }
    response.addHeader("Content-Disposition", "attachment; filename=" + rs.getString(1));

//    Blob blb = rs.getBlob(3);
//    byte[] bdata = blb.getBytes(1, (int) blb.length());
    byte[] bdata = x.getBytes();
    byte[] b = x.getBytes(Charset.forName("UTF-8"));
    OutputStream output = response.getOutputStream();
    output.write(bdata);
    output.close();
    rs.close();
    DbConnection.getConnection().close();
%>