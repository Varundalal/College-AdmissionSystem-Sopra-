<%

            String txtCollegeID = request.getParameter("cid");
            String txtStreams = request.getParameter("txtStreams");
            String txtSeats = request.getParameter("txtSeats");

       String message;



         int i=0;

           i = DB.Connect.saveStream(txtCollegeID, txtStreams, txtSeats);

      


       if (i > 0) {
            message="Stream Added Successfull";
              session.setAttribute("msg", message);
            response.sendRedirect("add_stream.jsp?cid="+txtCollegeID+"");
        } else {
               message="Failed to Add Stream";
                 session.setAttribute("msg", message);
            response.sendRedirect("add_stream.jsp?cid="+txtCollegeID+"");
        }
       %>