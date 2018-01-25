<%@include file="header_home.jsp" %>
	<div class="body">
		<div>
			
                    <div style="width: 80%;height:300px">
                        <div align="center">
                            <form action="login_db.jsp" method="post" style="width: 30%;height: 20%; " >
                            <table>
                                <tr>
                                    <td>
                                        <input type="text" id="txtusername" name="txtusername" placeHolder="Email ID" class="contact"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="password" id="txtpassword"  name="txtpassword" placeHolder="Password"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                             <input type="submit" id="submit" value="Submit" name="submit" class="selected" style="background-color: burlywood"/>

  <input type="reset" id="submit" value="Reset" class="selected" style="background-color: burlywood"/>

                                    </td>
                                  
                                </tr>
                                <tr>
                                  
                                    
                                    <td>
                                        <a href="register_user.jsp">
                                              <input type="button" value="New User"style="background-color: transparent;color: red"/>
                                          </a>
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

                        </div>
			</div>
                                
		</div>
                               
	</div>
	 <%@include file="footer_home.jsp" %>