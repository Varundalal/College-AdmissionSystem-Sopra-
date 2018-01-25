<%@page import="java.sql.ResultSet"%>
<%@include file="header_admin.jsp" %>
<script type="text/javascript" src="../js/scw.js" >

</script>
<div class="body">
    <div>
        <div align="center">
        

            <form  action="register_college_db.jsp" method="post">


             
                <span class="mySpan">
                    Add New College
                </span>

                <hr>
                <table>
                  
                    <tr>
                        <td>

                            <input type="text" id="txtemail" name="college_name" placeHolder="College Name" class="txtLogin" title="Email id" maxlength="50">

                        </td>

                    </tr>
                    <tr>
                        <td>
                            <textarea cols="20" rows="5"  name="description" placeHolder="Description" class="txtLogin" title="Middle Name" maxlength="100"></textarea>

                        </td>
                    </tr>
                    <tr>
                        <td>
                              <textarea cols="20" rows="5"  name="address" placeHolder="Address" class="txtLogin" title="Middle Name" maxlength="100"></textarea>

                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="text" id="txtdob" name="txtEligibility" placeHolder="Eligibility" class="txtLogin"  maxlength="50">

                        </td>
                    </tr>
                    
                   

                    <tr>
                        <td>

                            <input name="btnSignup" type="submit" class="btnLogin" id="btnSignup" value="Register" align="right" title="Sign up"  >

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