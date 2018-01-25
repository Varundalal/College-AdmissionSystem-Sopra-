
<%@include file="header_admin.jsp" %>
<div class="body">
    <div>
        <div align="center" style="width: 100%;height:300px" >
            <form class="frmUpload" action="college_details.jsp" method="post">
                <%=session.getAttribute("Message")%>
                <input type="text" name="txtsearch" id="txtsearch" class="upload_file" placeHolder="Key word"/>
                <br>
                <input type="submit" name="btnSubmit" id="btnSubmit" value="Search" class="btnLogin"/>


            </form>
        </div>
    </div>

</div>

<%@include file="footer_home.jsp" %>