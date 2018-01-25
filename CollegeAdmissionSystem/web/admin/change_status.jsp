<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<script type="text/javascript" src="../js/scw.js" >

</script>
<div class="body">
    <div>
        <div align="center" style="width: 100%;height:300px">
        

            <form  action="change_status_db.jsp" method="post">


             
                <span class="mySpan">
                  Change Status
                </span>

                <hr>
                <table>
                    <input type="hidden" name="admission_id" value="<%=request.getParameter("admission_id")%>">
                     <tr>
                        <td>
                            <select name="txtStatus">
                                <option>Select Status</option>
                                <option value="Accepted">Eligible for Councelling</option>
                                <option value="Cancelled">Cancelled</option>
                            </select>
                        </td>
                    </tr>
                   
                     <tr>
                        <td>

                            <input type="submit"  class="btnLogin" id="btnSignup" value="Change Status" align="right"   >

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <p style="color: red">
                                <%=session.getAttribute("msg")%>
                                <%session.setAttribute("msg", "");%>
                            </p>
                        </td>
                    </tr>
                </table>



            </form>
        </div>
    </div>


</div>

<%@include file="footer_home.jsp" %>