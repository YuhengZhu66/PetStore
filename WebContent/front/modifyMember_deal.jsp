<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="ins_member" scope="page" class="com.dao.MemberDaoImpl"/>
<jsp:useBean id="member" scope="request" class="com.model.Member">
<jsp:setProperty name="member" property="*"/>
</jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>Member information modification</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<%
	request.setCharacterEncoding("GBK");
	Integer id = member.getID();
	String pwd = member.getPwd();
	ResultSet rs = conn.executeQuery("select * from tb_Member where ID='" + id+ "'");
	String pwdSql="";
		while (rs.next()) {
			pwdSql = rs.getString("passWord");
		}
		if (!pwd.equals(pwdSql)) {
			out.println("<script language='javascript'>alert('The old password is incorrect！');window.location.href='modifyMember.jsp';</script>");
			return;
		}
	    
		int ret = 0;
		ret = ins_member.update(member); 
		if (ret != 0) {
		    session.setAttribute("username",member.getUsername());
			out.println("<script language='javascript'>alert('Member information modified successfully！');window.location.href='index.jsp';</script>");
		} else {
			out.println("<script language='javascript'>alert('Failed to modify member information！');window.location.href='modifyMember.jsp';</script>");
		}
%>
</body>
</html>
