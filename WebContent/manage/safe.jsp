<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*"%>
<%if (session.getAttribute("manager")==null){
	out.println("<script language='javascript'>alert('You are not recorded!');window.location.href='../index.jsp';</script>");
}%>
