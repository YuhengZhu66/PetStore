<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String ID[]=request.getParameterValues("delid");
String subTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		subTypeID=subTypeID+ID[i]+",";
	}
	subTypeID=subTypeID.substring(0,subTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_subType Where ID in("+subTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('Failed to delete the minor category');window.location.href='subType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('The subcategory information was deleted successfully!');window.location.href='subType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='subType.jsp';</script>");
}

%>
