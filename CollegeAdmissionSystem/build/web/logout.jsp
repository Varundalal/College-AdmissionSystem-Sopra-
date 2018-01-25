<%
session.removeAttribute("userid");
session.removeAttribute("usertype");
response.sendRedirect("index.jsp");
%>