<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%

            String username = session.getAttribute("userid").toString();
             DB.Connect.openConnection();
                String query = "select image  from tbluser where userid = " + username;
                ResultSet rs = DB.Connect.stat.executeQuery(query);


                // clear the response header information.
                response.reset();

                rs.next();
                Blob blb = rs.getBlob(1);
                byte[] bdata = blb.getBytes(1, (int) blb.length());

                // get the response Output stream object to write the content of the file into header
                OutputStream output = response.getOutputStream();

                output.write(bdata);
                output.close();
                // close the obejct of ResultSet
                rs.close();

                // close the connection object..
                DB.Connect.closeConnection();


          
%>