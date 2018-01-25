<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@include file="header_user.jsp" %>

<div class="body">
    <div>
        <div align="center" style="width: 100%;height:300px">
            <table>
                <tr>
                    <td>
                        <h3>
                           Remarks
                        </h3>
                    </td>

                </tr>

            </table>
            <% String i = "";
                        try {
                                DB.Connect.openConnection();
                            ResultSet rs = DB.Connect.stat.executeQuery("select userid from tblupload where assignment_id='" + request.getParameter("asnid") + "' and datediff(curdate(),rdate)>=0");
                            if (rs.next()) {
                                session.setAttribute("msg", "Either you have already uploaded the assignment or \nlast date of submission has been expired.");
                                response.sendRedirect("assignment.jsp");
                            }
                            DB.Connect.closeConnection();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }

            %>

            <form action="uploadDocuments_db.jsp" method="post" enctype="multipart/form-data">
                <table >
                    <tr>
                        <td>
                            <p>Select File</p>
                            <input type="hidden" name="txtAssID" value="<%=request.getParameter("asnid")%>">
                        </td>

                        <td>
                            <input type="file" name="txtfile" >
                        </td>

                    </tr>

                    <tr>
                        <td>

                        </td>
                        <td>
                            <input type="submit" name="btnSubmit" value="Upload">
                        </td>

                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>

                            <%
                                        String msg = session.getAttribute("msg").toString();
                                        if (msg.equalsIgnoreCase("success")) {
                                            out.println("<p style='color:green'>File uploaded Successfully</p>");
                                            session.setAttribute("msg", "");
                                        } else if (msg.equalsIgnoreCase("fail")) {
                                            out.println("<p style='color:red'>Failed to upload data</p>");
                                            session.setAttribute("msg", "");
                                        }
                            %>


                        </td>
                    </tr>
                </table>
            </form>

            <table>
                <tr>

                    <td>
                        <h3 align="right"><a href="uploaded_documents.jsp"> Uploaded Files

                            </a>

                        </h3>
                    </td>
                </tr>

            </table>

        </div>
    </div>

</div>

<%@include file="footer_home.jsp" %>