<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<div class="body">
    <div>
        <div style="width: 100%;height:300px;overflow: auto;"  >
            <table>
                 <tr border="0">
                   
                    <td align="center" style="color: red">  <%=session.getAttribute("Message")%>   <%session.setAttribute("Message", "");%></td>

                </tr>
            </table>
            <table border="1" cellspacing="1" cellpadding="1" style align="center" class="topMargin">

               
                <tr class="tblHeader">
                    <th>User ID</th>
                    <th>Student Name</th>
                      <th>Dated</th>
                    <th>Assignment Name</th>
                    <th>Description</th>
                    <th>Download</th>
                    <th>Delete</th>
                    <th>Status</th>
                    <th>Approve</th>
                    <th>Comment</th>

                </tr>
                <%


                            String query = "select* from files limit 20";


                            DB.Connect.openConnection();

                            ResultSet rs = DB.Connect.stat.executeQuery(query);
                            int count = 0;
                            while (rs.next()) {
                                String userid=rs.getString("userid");
                                String name="";
                                String sql1="Select fname,lname from tbluser where userid='"+userid+"'";
                                System.out.println(sql1);
                                 ResultSet rs1 = DB.Connect.stat1.executeQuery(sql1);
                                 if(rs1.next()){
                                    name=rs1.getString("fname")+" "+rs1.getString("lname");
                                 }
                                 String status=rs.getString("status");


                                 
                                out.println("<tr>"
                                        + "<td>" + userid + "</td>"
                                        + "<td>" + name+ "</td>"
                                       
                                        + "<td>" + rs.getString("dou") + "</td>"
                                        + "<td>" + rs.getString("ass_name") + "</td>"
                                      
                                        + "<td>" + rs.getString("desc") + "</td>"
                                        + "<td>" + "<a target='new' href='download.jsp?doc_name=" + rs.getString(3) + "&doc_type=" + rs.getString(5) + "'>" + " Download File</a>" + "</td>"
                                        + "<td>" + "<a href='delete_file.jsp?doc_id=" + rs.getString(1) + "'>" + " Delete File</a>" + "</td>"
                                        + "<td>" + status + "</td>"
                                        + "<td>" + "<a href='approve.jsp?doc_id=" + rs.getString(1) + "'>" + " Approve/Disapprove</a>" + "</td>"
                                        + "<td>" + "<a href='comment.jsp?doc_id=" + rs.getString(1) + "'>" + " Comment</a>" + "</td>"
                                        + "</tr>");
                                count++;
                            }
                            rs.close();
                            DB.Connect.closeConnection();
                            if (count == 0) {
                                out.println("<tr><td colspan='4'> No Files Found..!! </td></tr>");
                            }
                %>

            </table>

        </div>
    </div>


</div>
<%@include file="footer_home.jsp" %>