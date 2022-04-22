<%@ page language="java" contentType="text/html; charset=GBK" import="java.sql.ResultSet"
	pageEncoding="GBK"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl" />
<jsp:useBean id="member" scope="request" class="com.model.Member">
	<jsp:setProperty name="member" property="*" />
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("GBK");//Set the request encoding to GBK
		String username = member.getUsername();
		ResultSet rs = conn.executeQuery("select * from tb_Member where username='" + username + "'");
		if (rs.next()) {//If there is data in the result set
			out.println("<script language='javascript'>alert('The account already exists. Please register again！');"
					+ "window.location.href='register.jsp';</script>");
		} else {
			int ret = 0;//Records the variable that updates the number of records
			ret = ins_member.insert(member);//Save the membership information to the database
			if (ret != 0) {
				session.setAttribute("username", username);//Save the member account to Session
				out.println("<script language='javascript'>alert('Member registration successful！');"
						+ "window.location.href='index.jsp';</script>");
			} else {
				out.println("<script language='javascript'>alert('Member registration failed！');"
						+ "window.location.href='register.jsp';</script>");
			}
		}
	%>
</body>
</html>