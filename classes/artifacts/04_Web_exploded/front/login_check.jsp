<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!-- ����java.sql.ResultSet�� -->	
<%@ page import="java.sql.ResultSet"%>
<!-- ����ConnDB��Ķ��� -->	
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String username = request.getParameter("username");//��ȡ�˻�
	String checkCode = request.getParameter("checkCode");//��ȡ��֤��
	//if (checkCode.equals(session.getAttribute("randCheckCode").toString()))
	if(true){
		try {//��׽�쳣
			ResultSet rs = conn.executeQuery("select * from tb_Member where username='" 
	                                              + username + "'");
			if (rs.next()) {//����ҵ���Ӧ���˺�
				String PWD = request.getParameter("PWD");//��ȡ����
				if (PWD.equals(rs.getString("password"))) {//������������ͻ�ȡ������һ��
	                   //�ѵ�ǰ���˻����浽Session�У�ʵ�ֵ�¼
					session.setAttribute("username", username); 
					response.sendRedirect("index.jsp");//��ת��ǰ̨��ҳ
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
		} catch (Exception e) {//�����쳣
			out.println(
					"<script language='javascript'>alert('Your operation is wrong!');"
			        +"window.location.href='login.jsp';</script>");
		}
		conn.close();//�ر����ݿ�����
	}
%>
</body>
</html>