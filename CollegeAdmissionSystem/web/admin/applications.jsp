<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px" >
            <table border="1" cellspacing="2" cellpadding="2" style align="center" class="topMargin">
        <tr class="tblHeader">
          
            <th>Admission ID</th>
            <th>Student ID</th>
            <th>College Name</th>
            <th>Stream</th>
            <th>Applied on</th>
            <th>10th Marks</th>
            <th>12th Marks</th>
            <th>Status</th>           
            <th>Category</th>
            <th>Download File</th>
            <th>Change Status</th>
            
        </tr>
        <%
                    String search = session.getAttribute("userid").toString();
                    System.out.println("search c= " + search);

                    String query = "select admission_id,college_id,stream_id,status,rdate,tenth,twelveth,filename,content_type,userid,category from admission_form";

                    DB.Connect.openConnection();

                    ResultSet rs = DB.Connect.stat1.executeQuery(query);
                    int count = 0;
                    while (rs.next()) {
                    
                      
                        out.println("<tr>"
                                + "<td>" + rs.getString("admission_id") + "</td>"
                               + "<td>" + "<a href='individual_user.jsp?userid=" + rs.getString("userid")+"'>" +rs.getString("userid")+ " View Users</a>" + "</td>"

                                + "<td>" + DB.Connect.getField("tblcollege_details", "college_name", "college_id", rs.getString("college_id") , "=")  + "</td>"
                                + "<td>" +rs.getString("stream_id")   + "</td>"
                                + "<td>" + rs.getString("rdate") + "</td>"
                                + "<td>" + rs.getString("tenth") + "</td>"
                                + "<td>" + rs.getString("twelveth") + "</td>"                               
                                + "<td>" + rs.getString("status") + "</td>"                               
                                + "<td>" + rs.getString("category") + "</td>"
                                + "<td>" + "<a target='new' href='download.jsp?doc_name=" + rs.getString("filename")+"&doc_type="+ rs.getString("content_type")+"'>" + " Download</a>" + "</td>"
                                + "<td>" + "<a href='change_status.jsp?admission_id=" + rs.getString("admission_id")+"'>" + " Change Status</a>" + "</td>"

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