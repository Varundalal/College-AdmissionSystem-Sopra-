<%

            String txtquestion = request.getParameter("txtquestion");


            String faq_id = request.getParameter("txtid");
    int i=0;
            String message="";
            try {
             i= DB.Connect.updateField("tblfaq", "answer", txtquestion, "faq_id", faq_id);
             if(i>0){
                  session.setAttribute("msg", "Answer submitted successfully!!");
        response.sendRedirect("faq_list.jsp");
             }else{
              session.setAttribute("msg", "Failed to answer faq!!");
        response.sendRedirect("faq_list.jsp");
             }
            } catch (Exception e) {

                e.printStackTrace();
              
                    session.setAttribute("msg", "Failed to answer faq!!");
        response.sendRedirect("faq_list.jsp");
            }


%>