<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px" >
            <table border="1" cellspacing="2" cellpadding="2" style align="center" class="topMargin">
        <tr class="tblHeader">
          
            <th>College ID</th>
            <th>College Name</th>
            <th>Description</th>
            <th>Address</th>          
            <th>Eligibility</th>
            <th>Add Stream</th>
            
        </tr>
        <%
                    String search = request.getParameter("txtsearch");
                    System.out.println("search c= " + search);

                    String query = "select college_id,	college_name,	description,	address,	eligibility from tblcollege_details "
                            + "where college_name like '%"+search+"%'";

                    DB.Connect.openConnection();

                    ResultSet rs = DB.Connect.stat1.executeQuery(query);
                    int count = 0;
                    while (rs.next()) {
                    
                      
                        out.println("<tr>"
                                + "<td>" + rs.getString("college_id") + "</td>"
                                + "<td>" + rs.getString("college_name")  + "</td>"
                                + "<td>" + rs.getString("description") + "</td>"
                                + "<td>" + rs.getString("address") + "</td>"                             
                                + "<td>" + rs.getString("eligibility") + "</td>"
                                + "<td>" + "<a href='add_stream.jsp?cid=" + rs.getString(1)+"'>" + " Add Streams</a>" + "</td>"

                                + "</tr>");
                        count++;
                    }
                    rs.close();
                    DB.Connect.closeConnection();
                    if (count == 0) {
                        out.println("<tr><td colspan='4'> No Users Found..!! </td></tr>");
                    }
        %>
    </table>

        </div>
    </div>

    

</div>
        <%@include file="footer_home.jsp" %>