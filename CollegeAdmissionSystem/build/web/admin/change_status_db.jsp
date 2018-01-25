<%

            String admission_id = request.getParameter("admission_id");
            String txtStatus = request.getParameter("txtStatus");
          

       String message;



         int i=0;

           i = DB.Connect.updateField("admission_form", "status", txtStatus, "admission_id", admission_id);

      


       if (i > 0) {
            message="Status updated Successfull";
              session.setAttribute("msg", message);
            response.sendRedirect("change_status.jsp?admission_id="+txtStatus+"");
        } else {
               message="Failed to Add Stream";
                 session.setAttribute("msg", message);
            response.sendRedirect("change_status.jsp?admission_id="+txtStatus+"");
        }
       %>