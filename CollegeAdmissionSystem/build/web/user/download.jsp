<%@page import="java.io.File"%>
<%@page import="com.mysql.jdbc.BlobFromLocator"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.Blob"%>
<%@page import="java.sql.ResultSet"%>
<%
            //three tasks are done here


            try {
                String s = session.getAttribute("userid").toString();
                if (s.isEmpty()) {
                    response.sendRedirect("../logout.jsp");
                }
            } catch (Exception e) {
                // e.printStackTrace();
                response.sendRedirect("../logout.jsp");
            }

            String doc_name = request.getParameter("doc_name");
            String doc_type = request.getParameter("doc_type");
           String ext="";
           
            if (doc_type.equalsIgnoreCase("application/octet-stream")) {
                ext=".txt";
            } else if (doc_type.equalsIgnoreCase("application/pdf")) {
               ext=".pdf";
            } else if (doc_type.equalsIgnoreCase("application/pdf")) {
                ext=".docx";
                
            } else if (doc_type.equalsIgnoreCase("application/pdf")) {
                ext=".xlxs";
               
            }else if (doc_type.equalsIgnoreCase("image/jpeg")) {
                ext=".jpg";

            }
            else if (doc_type.equalsIgnoreCase("text/plain")) {
                ext=".txt";

            }
            else if (doc_type.equalsIgnoreCase("application/vnd.openxmlformats-officedocument.wordprocessingml.document")) {
                ext=".docx";

            }
          
        String imagePath =  "../UploadedDocuments/"+doc_name;

         response.sendRedirect(imagePath+ext);

         
            // close the connection object..
            DB.Connect.closeConnection();

%>