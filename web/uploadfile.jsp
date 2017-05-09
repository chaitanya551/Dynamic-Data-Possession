<%@page import="java.io.FileReader"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="com.multi.action.TrippleDes"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.util.Enumeration"%>
<%@page import="com.multi.database.DbConnection"%>
<%@page import="java.io.InputStream"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%
    String uname = session.getAttribute("uid").toString();
    String rtempfile = File.createTempFile("temp", "1").getParent();
    System.out.println("The File Temporary Path " + rtempfile);
// get the file from the previous page form           
// save the file in temporary directory of server
// specify the max size = 15MB
    MultipartRequest multi = new MultipartRequest(request, rtempfile, 15 * 1024 * 1024);

    Enumeration files = multi.getFileNames();

    String st1 = "insert into loc1(filename, type, content, upload_by, location) values (?,?,?,?,?)";
    String st2 = "insert into loc2(filename, type, content, upload_by, location) values (?,?,?,?,?)";
    String st3 = "insert into loc3(filename, type, content, upload_by, location) values (?,?,?,?,?)";
    String st4 = "insert into loc4(filename, type, content, upload_by, location) values (?,?,?,?,?)";

// get the connection object from another class MyConnection's method getConnection();
// and create the prepareStatement
    PreparedStatement psmt1 = DbConnection.getConnection().prepareStatement(st1);
    PreparedStatement psmt2 = DbConnection.getConnection().prepareStatement(st2);
    PreparedStatement psmt3 = DbConnection.getConnection().prepareStatement(st3);
    PreparedStatement psmt4 = DbConnection.getConnection().prepareStatement(st4);

    String name = "";
    String fileExtesion = "";
    File ff = null;
    FileInputStream fin = null;

    while (files.hasMoreElements()) {
        name = (String) files.nextElement();
        ff = multi.getFile(name);
        fileExtesion = ff.getName().substring(ff.getName().lastIndexOf("."));

        // check user has select the correct file or not
        boolean fileAllowed = fileExtesion.equalsIgnoreCase(".txt")
                || fileExtesion.equalsIgnoreCase(".pdf")
                || fileExtesion.equalsIgnoreCase(".doc")
                || fileExtesion.equalsIgnoreCase(".docx");

        if ((ff != null) && fileAllowed) {

            try {
                /*Location 1*/
                fin = new FileInputStream(ff);
                psmt1.setString(1, ff.getName());
                psmt1.setString(2, fileExtesion);
//                psmt1.setBinaryStream(3, (InputStream) fin, (int) (ff.length()));
                
                psmt1.setString(4, uname);        // pass the user name or id 
                psmt1.setString(5, "India");        
                boolean sss1 = psmt1.execute();
                /*Location 2*/
                fin = new FileInputStream(ff);
                psmt2.setString(1, ff.getName());
                psmt2.setString(2, fileExtesion);
                psmt2.setBinaryStream(3, (InputStream) fin, (int) (ff.length()));
                psmt2.setString(4, uname);  
                psmt2.setString(5, "USA"); // pass the user name or id 
                boolean sss2 = psmt2.execute();
                /*Location 3*/
                fin = new FileInputStream(ff);
                psmt3.setString(1, ff.getName());
                psmt3.setString(2, fileExtesion);
                psmt3.setBinaryStream(3, (InputStream) fin, (int) (ff.length()));
                psmt3.setString(4, uname);  
                psmt3.setString(5, "UK"); // pass the user name or id 
                boolean sss3 = psmt3.execute();
                /*Location 4*/
                fin = new FileInputStream(ff);
                psmt4.setString(1, ff.getName());
                psmt4.setString(2, fileExtesion);
                psmt4.setBinaryStream(3, (InputStream) fin, (int) (ff.length()));
                psmt4.setString(4, uname);  
                psmt4.setString(5, "CHINA"); // pass the user name or id 
                boolean sss4 = psmt4.execute();
                if(sss1==true&&sss2==true&&sss3==true&&sss4==true)
                {
                    out.println("Success");
                }
                else
                {
                    out.println("Failed");
                }
            } catch (Exception e) {
                out.print("Failed due to " + e);
            } finally {
                // next statement is must otherwise file will not be deleted from the temp as fin using f.
                // its necessary to put outside otherwise at the time of exception file will not be closed.
                fin.close();
                ff.delete();
            }
        } else {
            out.print("Please select the correct file...");
        }// end of if and else
    }// end of while
%>
<%!
 private static String getStringFromInputStream(FileReader is) {

        BufferedReader br = null;
        StringBuilder sb = new StringBuilder();

        String line;
        try {

            br = new BufferedReader(new FileReader(is));
            while ((line = br.readLine()) != null) {
                sb.append(line + "\n");
            }

        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (br != null) {
                try {
                    br.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }

        return sb.toString();

    }
%>