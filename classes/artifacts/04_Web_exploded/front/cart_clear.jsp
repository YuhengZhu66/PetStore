<%@ page contentType="text/html; charset=GBK" language="java" %>
<%
session.removeAttribute("cart");
response.sendRedirect("cart_null.jsp");//Go to shopping cart for empty pages
%>
