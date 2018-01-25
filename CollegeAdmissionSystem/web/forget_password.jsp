<%@include file="header_home.jsp" %>
<div class="body">
    <div>

        <div style="width: 80%;height:300px">
            <div align="center">
                <form action="forget_password_db.jsp" method="post" style="width: 30%;height: 20%; " >
                    <table>
                        <tr>
                            <td>
                                <input type="text" id="txtusername" name="txtusername" placeHolder="Email ID" class="contact"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <select name="txtQuestion">
                                    <option value="Q">
                                        Select Question
                                    </option>
                                    <option value="A">
                                        A
                                    </option>
                                    <option value="B">
                                        B
                                    </option>
                                    <option value="C">
                                        C
                                    </option>
                                    <option value="D">
                                        D
                                    </option>
                                    <option value="E">
                                        E
                                    </option>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="text" id="txtusername" name="txtAnswer" placeHolder="Answer" class="contact"/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <input type="submit" id="submit" value="Submit" name="submit" class="selected" style="background-color: burlywood"/>

                                <input type="reset" id="submit" value="Reset" class="selected" style="background-color: burlywood"/>

                            </td>

                        </tr>

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
                            <a href="login.jsp">
                                <input type="button" value="Back" style="background-color: transparent;color: deepskyblue;font-size: larger"/>
                            </a>

                        </td>
                    </tr>
                </table>
            </div>
        </div>
      
    </div>

</div>
<%@include file="footer_home.jsp" %>