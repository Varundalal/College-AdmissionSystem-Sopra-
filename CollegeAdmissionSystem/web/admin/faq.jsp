<%@include file="header_admin.jsp" %>
<div class="body">
    <div>

        <div style="width: 100%;height:300px">
            <form  action="faq_db.jsp" method="post" >


          <table  border="0" cellspacing="20" cellpadding="8" style align="center">

                                            <tr>
                                                <td>
                                                    <fieldset>
                                                        <legend>FAQ</legend>
                                                        <table cellpadding="5" cellspacing="5">
                                                            <input type="hidden" name="txtid" value="<%=request.getParameter("faq_id")%>"
                                                              <tr>
                                                               <td class="text">Answer:</td>
                                                                <td>
                                                                    <textarea cols="20" rows="5"  size="25"   name="txtquestion"></textarea>

                                                                </td>
                                                              </tr>
                                                             
                                                        </table>
                                                    </fieldset>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="color: red">  <%=session.getAttribute("msg")%>   <%session.setAttribute("msg","");%></td>
                                            </tr>
                                            <tr>
                                                <td align="center" colspan="2" >
                                                    <input type="submit" class="btnSubmit1" onclick= "return valid2()"value="Submit" />
                                                    <input type= "reset" class="btnSubmit1" value="Reset"/>
                                                </td>
                                            </tr>
                                        </table>
                                    </form>

        </div>
    </div>
</div>
<%@include file="footer_home.jsp" %>
