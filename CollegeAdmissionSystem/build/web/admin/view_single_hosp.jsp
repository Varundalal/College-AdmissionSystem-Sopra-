
<%@page import="java.sql.ResultSet"%>
<%




            String id = request.getParameter("userid");

            //String id = "1";
        

            String name = "";
            String emailid = "";
            String mobile = "";
            String address = "";
            String rdate = "";
            String dob = "";
            String gender = "";


            String query = "select * from tbluser where userid='" + id + "' ";
            DB.Connect.openConnection();

            ResultSet rs = DB.Connect.stat.executeQuery(query);
           
            if (rs.next()) {

                name = rs.getString("fname")+" "+rs.getString("lname");
                emailid = rs.getString("emailid");
                mobile = rs.getString("mobile");
                address = rs.getString("address");
                rdate = rs.getString("rdate");
                dob = rs.getString("dob");
                gender = rs.getString("gender");

            }
            rs.close();
            DB.Connect.closeConnection();

%>
<img src="displayImage.jsp?userid='<%=id%>'" alt="no image found" class="leftuser"  height="150px"/>
 <table border="1" class="leftuser" style="margin-top: 0">
    <tr class="tblHeader">
        <th>User</th>
        <th>Details</th>

    </tr>
    <tr>
        <td>User ID</td>
        <td><%=id%></td>
    </tr>
    <tr>
        <td> Name</td>
        <td><%=name%></td>
    </tr>
    <tr>
        <td> Gender</td>
        <td><%=gender%></td>
    </tr>
    <tr>
        <td>Email ID</td>
        <td><%=emailid%></td>
    </tr>
    <tr>
        <td>Mobile</td>
        <td><%=mobile%></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><%=address%></td>
    </tr>
    <tr>
        <td>Registration Date</td>
        <td><%=rdate%></td>
    </tr>
    <tr>
        <td>Date of Birth</td>
        <td><%=dob%></td>
    </tr>

</table>
