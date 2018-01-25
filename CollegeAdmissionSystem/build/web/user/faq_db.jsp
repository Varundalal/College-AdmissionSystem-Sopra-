<%

            String txtquestion = request.getParameter("txtquestion");


            String userid = session.getAttribute("userid").toString();
    int i=0;
            String message="";
            try {
             i= DB.Connect.saveFaq(userid, txtquestion);
             if(i>0){
                  session.setAttribute("msg", "Faq sent successfully!!");
        response.sendRedirect("faq.jsp");
             }else{
              session.setAttribute("msg", "Failed to sent faq!!");
        response.sendRedirect("faq.jsp");
             }
            } catch (Exception e) {

                e.printStackTrace();
              
                    session.setAttribute("msg", "Failed to sent faq!!");
        response.sendRedirect("faq.jsp");
            }


%>