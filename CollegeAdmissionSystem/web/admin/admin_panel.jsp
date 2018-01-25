<%@include file="admin_head.html" %>
 
  <div id="main_content">
   <%="Welcome "+session.getAttribute("fname")%>
     <%session.setAttribute("Message","");%>
  </div>

<%@include file="../footer.html" %>