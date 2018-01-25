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



            String txtusername = request.getParameter("txtusername");
            String txtQuestion = request.getParameter("txtQuestion");
            String txtAnswer = request.getParameter("txtAnswer");
            boolean b=false;
            if (txtusername.length() < 5 || txtQuestion.length() > 2 || txtAnswer.length() < 1) {
            } else {
                try {
                    con = DB.Connect.openConnection();

                    String query = "select emailid from tblsecurity where emailid='" + txtusername + "' and question='" + txtQuestion + "' and answer='" + txtAnswer + "'";
                    System.out.println("query : " + query);
                    pst = con.prepareStatement(query);
                    rs = pst.executeQuery();
                    if (rs.next()) {
                       b=true;
                    }


                } catch (Exception e) {
                    e.printStackTrace();
                }

            }



            if (b) {

              session.setAttribute("emailid", txtusername);
                response.sendRedirect("reset_password.jsp");
            }  else {
                session.setAttribute("msg", "Sorry Wrong Question or Answer!!");
              
                response.sendRedirect("forget_password.jsp");
            }

%>