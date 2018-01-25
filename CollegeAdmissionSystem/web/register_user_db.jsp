<%  String message="";
try{


            String txtemailid = request.getParameter("txtemailid");
           
            String txtUsertype = request.getParameter("txtUsertype");
        String txtfirstname = request.getParameter("txtfname");

        String txtlastname = request.getParameter("txtlastname");
        String txtdob = request.getParameter("txtdob");
        String cmbgender = request.getParameter("cmbgender");

        if(!(txtemailid.contains("@") && txtemailid.contains(".com") )){
              session.setAttribute("msg", "Email ID should be of six digit");
            response.sendRedirect("register_user.jsp");
        }else{
          String txtmobile = request.getParameter("txtmobile");

        String txtaddress = request.getParameter("txtaddress");

        String txtConfirm_password = request.getParameter("txtConfirm_password");
        String txtpassword = request.getParameter("txtpassword");

        System.out.print("details==" + txtfirstname + ":" + cmbgender);
        boolean b = false;


        if (txtpassword.equalsIgnoreCase(txtConfirm_password)) {
            b = true;
            if (txtpassword.equalsIgnoreCase("") || txtConfirm_password.equalsIgnoreCase("")) {
                b = false;

            }
        }
         int i=0;
        if(b){
           DB.Connect.openConnection();


           i = DB.Connect.saveStudent(txtfirstname, txtlastname, txtemailid, txtaddress, "True", txtUsertype, txtpassword, txtmobile,cmbgender,txtdob);

        if(i>0){

            DB.Connect.closeConnection();
        }

        }
           if (i > 0) {
            message="Registration Successfull";
              session.setAttribute("msg", message);
            response.sendRedirect("register_user.jsp");
        } else {
               message="Registration Failed";
                 session.setAttribute("msg", message);
            response.sendRedirect("register_user.jsp");
        }
        }
      
     
         }catch(Exception e){
          message="Registration Failed";
                 session.setAttribute("msg", message);
            response.sendRedirect("register_user.jsp");
         }
       %>