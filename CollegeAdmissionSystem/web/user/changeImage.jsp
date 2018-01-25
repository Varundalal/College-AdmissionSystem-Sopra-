<%@page import="java.io.InputStream"%>
<%

            InputStream inputStream = null; // input stream of the upload file
            // obtains the upload file part in this multipart request
            Part filePart = request.getPart("txtfile");
            filePart.toString();
            if (filePart != null) {
                // prints out some information for debugging
                inputStream = filePart.getInputStream();
            }
            String message = "";
            String userid = session.getAttribute("userid").toString();
            int row = DB.Connect.changeImage(userid, inputStream);
            if (row > 0) {
                message = "File uploaded and saved into database";
                System.out.print("message=" + message);
            } else {
                message = "An error has occured";
            }
            session.setAttribute("Message", message);
            // forwards to the message page
           response.sendRedirect("profile.jsp");
%>