<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String username = request.getParameter("username");
	if(true){
		try {
			ResultSet rs = conn.executeQuery("select * from tb_Member where username='" 
	                                              + username + "'");
			if (rs.next()) {//If we find the corresponding account number
				String PWD = request.getParameter("PWD");
				if (PWD.equals(rs.getString("password"))) {
	                   //Save the current account to Session for login
					session.setAttribute("username", username); 
					response.sendRedirect("index.jsp");
				} else {
					out.println(
			"<script language='javascript'>alert('The user name or password you entered is wrong!');"
					        +"window.location.href='login.jsp';</script>");
				}
			} else {
				out.println(
					"<script language='javascript'>alert('You entered the wrong username or password, or your account"+
	                   "has been frozen!');window.location.href='login.jsp';</script>");
			}
		} catch (Exception e) {
			out.println(
					"<script language='javascript'>alert('Your operation is wrong!');"
			        +"window.location.href='login.jsp';</script>");
		}
		conn.close();
	}
%>
</body>
</html>