<%@page import="java.sql.ResultSet"%>
<%@include file="header_user.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px" >
            <table border="1" cellspacing="2" cellpadding="2" style align="center" class="topMargin">
        <tr class="tblHeader">
          
            <th>College ID</th>
            <th>Streams</th>
            <th>Total Seats</th>
           
            <th>Apply on Stream</th>
            
        </tr>
        <%
                    String search = request.getParameter("cid");
                    System.out.println("search c= " + search);

                    String query = "select college_id,	streams,	seats from tblstreams "
                            + "where college_id = '"+search+"'";

                    DB.Connect.openConnection();

                    ResultSet rs = DB.Connect.stat1.executeQuery(query);
                    int count = 0;
                    while (rs.next()) {
                    
                      
                        out.println("<tr>"
                                + "<td>" + rs.getString("college_id") + "</td>"
                                + "<td>" + rs.getString("streams")  + "</td>"
                                + "<td>" + rs.getString("seats") + "</td>"
                               
                                + "<td>" + "<a href='apply_on_streams.jsp?cid=" + rs.getString(1)+"&streams="+ rs.getString(2)+"'>" + " Apply on Streams</a>" + "</td>"

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

        </div>
    </div>

    

</div>
        <%@include file="footer_home.jsp" %>