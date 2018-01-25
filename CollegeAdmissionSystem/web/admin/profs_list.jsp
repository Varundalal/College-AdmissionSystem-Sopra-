<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px" >
            <table border="1" cellspacing="2" cellpadding="2" style align="center" class="topMargin">
        <tr class="tblHeader">
            <th>User ID</th>
            <th>Professor Name</th>
            <th> Email ID</th>
            <th> Mobile</th>
               <th>Registration Date</th>
            <th>Date of Birth</th>
            <th>View Details</th>
        </tr>
        <%
                    String search = request.getParameter("txtsearch");
                    System.out.println("search c= " + search);

                    String query = "select tbluser.userid,tbluser.fname,tbluser.lname,tbluser.emailid,tbluser.mobile,tbluser.rdate,tbluser.dob from tbluser "
                            + "where (tbluser.userid='" + search + "' || fname like '%" + search + "%' || emailid like '%" + search + "%' || dob ='" + search + "') and usertype='prof'";

                    DB.Connect.openConnection();

                    ResultSet rs = DB.Connect.stat.executeQuery(query);
                    int count = 0;
                    while (rs.next()) {
                   


                        out.println("<tr>"
                                + "<td>" + rs.getString("userid") + "</td>"
                                + "<td>" + rs.getString("fname")+" "+rs.getString("lname")  + "</td>"
                                + "<td>" + rs.getString("emailid") + "</td>"
                                + "<td>" + rs.getString("mobile") + "</td>"                                
                              
                                + "<td>" + rs.getString("rdate") + "</td>"
                                + "<td>" + rs.getString("dob") + "</td>"
                                + "<td>" + "<a href='individual_prof.jsp?userid=" + rs.getString(1)+"'>" + " View Users</a>" + "</td>"
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