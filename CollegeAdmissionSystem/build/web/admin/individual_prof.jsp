<%@include file="header_admin.jsp" %>

<div class="body">
    <div>
        <div align="center">
            <h2 align="center" >Professor Details</h2>
            <%session.setAttribute("msg", "");%>

            <%@include file="view_single_hosp.jsp" %>
            <div>
                <%@include file="prof_subject.jsp" %>
            </div>
        </div>
    </div>

</div>

<%@include file="footer_home.jsp" %>