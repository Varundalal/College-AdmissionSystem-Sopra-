<%@include file="header_home.jsp" %>
<div class="body">
    <div>

        <div style="width: 80%;height:300px">
            <div align="center">
                <form action="reset_password_db.jsp" method="post" style="width: 30%;height: 20%; " >
                    <%
                                String emailid = session.getAttribute("emailid").toString();
                                try {
                                    if (emailid.length() < 5) {
                                        session.setAttribute("msg", "Invalid Attempt");
                                        session.removeAttribute("emailid");
                                        response.sendRedirect("login.jsp");
                                    }

                                } catch (Exception e) {
                                    session.setAttribute("msg", "Invalid Attempt");
                                    session.removeAttribute("emailid");
                                    response.sendRedirect("login.jsp");
                                }
                    %>
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="txtusername" name="txtnewpass" placeHolder="New Password" class="contact"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="txtusername" name="txtconfirmpass" placeHolder="Confirm Password" class="contact"/>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <input type="submit" id="submit" value="Submit" name="submit" class="selected" style="background-color: burlywood"/>

                                <input type="reset" id="submit" value="Reset" class="selected" style="background-color: burlywood"/>

                            </td>

                        </tr>
                        <input type="hidden" value="<%=emailid%>" name="emailid">

                    </table>
                    <table align="center" style="margin-top: -10px;">
                        <tr>
                            <td>
                                <p style="color: red">
                                    <%
                                                try {
                                                    String msg = session.getAttribute("msg").toString();
                                                    if (msg != null) {
                                                        out.println(msg);
                                                        session.setAttribute("msg", "");
                                                    } else {
                                                        session.setAttribute("msg", "");
                                                    }

                                                } catch (Exception e) {
                                                    session.setAttribute("msg", "");
                                                }
                                    %>
                                </p>
                            </td>
                        </tr>
                    </table>
                </form>
                <table align="left">
                    <tr>

                        <td>
                            <a href="forget_password.jsp">
                                <input type="button" value="Back" style="background-color: transparent;color: deepskyblue;font-size: larger"/>
                            </a>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <%@include file="proposals.jsp" %>
    </div>

</div>
<%@include file="footer_home.jsp" %>