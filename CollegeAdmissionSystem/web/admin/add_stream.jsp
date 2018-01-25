<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<script type="text/javascript" src="../js/scw.js" >

</script>
<div class="body">
    <div>
        <div align="center" style="width: 100%;height:300px">
        

            <form  action="add_stream_db.jsp" method="post">


             
                <span class="mySpan">
                  Add Stream
                </span>

                <hr>
                <table>
                    <input type="hidden" name="cid" value="<%=request.getParameter("cid")%>">
                     <tr>
                        <td>
                            <input type="text" name="txtStreams" placeHolder="Stream">
                        </td>
                    </tr>
                     <tr>
                        <td>
                            <input type="text" name="txtSeats" placeHolder="Seats">
                        </td>
                    </tr>
                     <tr>
                        <td>

                            <input type="submit"  class="btnLogin" id="btnSignup" value="Add Stream" align="right"   >

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