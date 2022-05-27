<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String ID[]=request.getParameterValues("delid");
String superTypeID="";
if (ID.length>0){
	for(int i=0;i<ID.length;i++){
		superTypeID=superTypeID+ID[i]+",";
	}
	superTypeID=superTypeID.substring(0,superTypeID.length()-1);
	int ret=-1;
	String sql="Delete From tb_superType Where ID in("+superTypeID+")";
	ret=conn.executeUpdate(sql);
	if(ret==0){
		out.println("<script lanuage='javascript'>alert('This category already contains sub-category information. Delete the sub-category information first and then delete it!');window.location.href='superType.jsp';</script>");
	}else{
		out.println("<script lanuage='javascript'>alert('The super category information was deleted successfully!');window.location.href='superType.jsp';</script>");
	}
}else{
	out.println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='superType.jsp';</script>");
}
%>
