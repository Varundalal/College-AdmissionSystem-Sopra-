<%

            String college_name = request.getParameter("college_name");
            String description = request.getParameter("description");
            String address = request.getParameter("address");
        String txtEligibility = request.getParameter("txtEligibility");
      
       String message;
       

       
         int i=0;
     
           i = DB.Connect.saveCollege(college_name, description, address, txtEligibility);
          
      

        
       if (i > 0) {
            message="Registration Successfull";
              session.setAttribute("msg", message);
            response.sendRedirect("register_college.jsp");
        } else {
               message="Registration Failed";
                 session.setAttribute("msg", message);
            response.sendRedirect("register_college.jsp");
        }
       %>