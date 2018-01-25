<%@page import="java.awt.image.Raster"%>
<%@page import="javax.imageio.ImageIO"%>
<%@page import="java.awt.image.BufferedImage"%>
<%@page import="java.io.File"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%
            //find project location for matching thumb impression

            Connection con = null;
            ResultSet rs = null;
            PreparedStatement pst = null;



            String txtnewpass = request.getParameter("txtnewpass");
            String txtconfirmpass = request.getParameter("txtconfirmpass");
            String emailid = request.getParameter("emailid");
            boolean b=false;
            if (txtnewpass.length() < 5 || emailid.length() < 1) {
            } else if(txtnewpass.equalsIgnoreCase(txtconfirmpass)){
                try {
                    con = DB.Connect.openConnection();

                    String query = "update tbluser set password='"+txtnewpass+"' where emailid='"+emailid+"'";
                    System.out.println("query : " + query);
                    pst = con.prepareStatement(query);
                    int i = pst.executeUpdate();
                    if (i>0) {
                       b=true;
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            }



            if (b) {

           session.setAttribute("msg", "Your password has been reset successfully, please login with new password.");
                response.sendRedirect("login.jsp");
            }  else {
                session.setAttribute("msg", "Please check both new password and confirm password.");
              
                response.sendRedirect("reset_password.jsp");
            }

%>