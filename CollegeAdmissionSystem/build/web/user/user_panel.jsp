<%@include file="header_user.jsp" %>

<div class="body">
    <div>
        <div align="center">
            <%="Welcome " + session.getAttribute("fname")%>
            <%session.setAttribute("Message", "");%>
        </div>
    </div>

</div>

<%@include file="footer_home.jsp" %>