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
            String usertype = "";
            String txtusername = request.getParameter("txtusername");
            String txtpassword = request.getParameter("txtpassword");


            String userid = null;
            String fname="";
            try {
                con = DB.Connect.openConnection();

                String query = "select usertype,userid,fname,lname from tbluser where emailid='" + txtusername + "' and password='" + txtpassword + "'";
                System.out.println("query : " + query);
                pst = con.prepareStatement(query);
                rs = pst.executeQuery();
                if (rs.next()) {
                    // System.out.println("aaaaaaaaaaaaaaaaaaaa");
                    usertype = rs.getString(1);
                    userid = rs.getString("userid");
                    fname=rs.getString("fname")+" "+rs.getString("lname");
                }


            } catch (Exception e) {
                e.printStackTrace();
            }

            if (usertype.equalsIgnoreCase("admin")) {

                session.setAttribute("usertype", usertype);
                session.setAttribute("userid", userid);
                session.setAttribute("fname", fname);
                response.sendRedirect("admin/profile.jsp");
            } else if (usertype.equalsIgnoreCase("user")) {
                session.setAttribute("usertype", usertype);
                session.setAttribute("userid", userid);
                session.setAttribute("fname", fname);
                response.sendRedirect("user/profile.jsp");
            } else if (usertype.equalsIgnoreCase("prof")) {
                session.setAttribute("usertype", usertype);
                session.setAttribute("userid", userid);
                session.setAttribute("fname", fname);
                response.sendRedirect("prof/profile.jsp");
            } else {
                session.setAttribute("msg", "Sorry you are not authenticated!!");
                session.setAttribute("emailid", "");
                response.sendRedirect("login.jsp");
            }

%>