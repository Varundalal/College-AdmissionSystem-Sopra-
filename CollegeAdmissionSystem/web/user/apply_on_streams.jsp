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
                        Apply for Admission
                        </h3>
                    </td>

                </tr>

            </table>
            <% 

            %>

            <form action="apply_on_streams_db.jsp" method="post" enctype="multipart/form-data">

                <table >
                    <tr>
                        <td>
                            <p>Upload Your Documents</p>
                            <input type="hidden" name="college_id" value="<%=request.getParameter("cid")%>">
                            <input type="hidden" name="stream_id" value="<%=request.getParameter("streams")%>">
                        </td>

                        <td>
                            <input type="file" name="txtfile" >
                        </td>

                    </tr>
                       <tr>
                           <td>
                               Select Category
                           </td>
                        <td>
                            <select  id="cmbgender" name="txtcategory" class="txtLogin">
                                <option value="Select">------ Select Category------ </option>
                                <option value="General">General</option>
                                <option value="OBC">OBC</option>
                                <option value="SC">SC</option>
                                <option value="SC/ST">SC/ST</option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td>
                             <p>10 th %</p>
                        </td>
                        <td>
                            <input type="text" name="tenth" maxlength="3">
                        </td>

                    </tr>
                    <tr>

                        <td>
                             <p>12 th %</p>
                        </td>
                             <td>
                                 <input type="text" name="twelveth" maxlength="3">
                        </td>
                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>
                            <input type="submit" name="btnSubmit" value="Apply">
                        </td>

                    </tr>
                    <tr>
                        <td>

                        </td>
                        <td>

                            <%
                            try{
                                 String msg = session.getAttribute("msg").toString();
                                        if (msg.length()>0) {
                                            out.println("<p style='color:green'>"+msg+"</p>");
                                            session.setAttribute("msg", "");
                                        }
                            }catch(Exception e){}
                                       
                            %>


                        </td>
                    </tr>
                </table>
            </form>

            
        </div>
    </div>

</div>

<%@include file="footer_home.jsp" %>