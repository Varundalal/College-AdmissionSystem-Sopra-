
<%@include file="header_admin.jsp" %>
<div class="body">
    <div >
        <div style="width: 100%;height:300px">
            <div align="center">
                <form action="changeImage" method="post" enctype="multipart/form-data">
                    <%=session.getAttribute("Message")%>
                    <table>
                        <tr>
                            <td>
                                <input type="file" name="txtfile" id="txtfile" class="upload_file"/>
                            </td>
                        </tr>

                        <tr>
                            <td>

                                <input type="submit" name="btnSubmit" id="btnSubmit" value="Upload" class="selected" style="background-color: burlywood"/>

                            </td>
                        </tr>

                    </table>




                </form>
            </div>
        </div>


    </div>
</div>

<%@include file="footer_home.jsp" %>