<%@page import="java.sql.ResultSet"%>
<%@include file="header_home.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px" >
            <table border="1" cellspacing="2" cellpadding="2" style align="center" class="topMargin">
        <tr class="tblHeader">
          
            <th>FAQ ID</th>
            <th>Student Name</th>
            <th>Question</th>
            <th>Answer</th>
           
         
            
        </tr>
        <%
                 
             

                    String query = "select * from tblfaq";

                    DB.Connect.openConnection();

                    ResultSet rs = DB.Connect.stat1.executeQuery(query);
                    int count = 0;
                    while (rs.next()) {
                    
                      
                        out.println("<tr>"
                                + "<td>" + rs.getString("faq_id") + "</td>"
                               + "<td>" +DB.Connect.getField("tbluser", "fname", "userid", rs.getString("userid"), "=")+ "</td>"

                                + "<td>" +rs.getString("question")   + "</td>"
                                + "<td>" + rs.getString("answer") + "</td>"
                     
                                + "</tr>");
                        count++;
                    }
                    rs.close();
                    DB.Connect.closeConnection();
                    if (count == 0) {
                        out.println("<tr><td colspan='4'> No Details Found..!! </td></tr>");
                    }
        %>
        
    </table>
  <%
   try{
                                 String msg = session.getAttribute("msg").toString();
                                        if (msg.length()>0) {
                                            out.println("<table allign='center'><tr><td><p style='color:green'>"+msg+"</p></td></tr></table>");
                                            session.setAttribute("msg", "");
                                        }
                            }catch(Exception e){}

                            %>
        </div>
    </div>

    

</div>
        <%@include file="footer_home.jsp" %>