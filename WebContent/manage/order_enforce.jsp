<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
</head>

<body>
<%
if(request.getParameter("ID")!=""){
	int ID=Integer.parseInt(request.getParameter("ID"));
	String sql="update tb_order set enforce=1 where orderID="+ID;
	int ret=0;
	ret=conn.executeUpdate(sql);
	if (ret!=0){
		out.println("<script language='javascript'>alert('Order executed successfully！');window.location.href='ordermanage.jsp';</script>");
		}else{
		out.println("<script language='javascript'>alert('Order execution failure！');window.location.href='ordermanage.jsp';</script>");
	}
}
%>
</body>
</html>
