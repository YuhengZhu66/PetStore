<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="up_good" scope="page" class="com.dao.GoodDaoImpl"/>
<jsp:useBean id="good" scope="page" class="com.model.Goods">
<jsp:setProperty name="good" property="*"/>
</jsp:useBean>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
Integer id=good.getID();
ResultSet rs=conn.executeQuery("select * from tb_good where ID="+id);
if (!rs.next()){
	out.println("<script language='javascript'>alert('Your operation is wrong��');window.location.href='index.jsp';</script>");
}else{
	int ret=0;
        ret=up_good.update(good);
	if (ret!=0){
          out.println("<script language='javascript'>alert('The product information is modified successfully��');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('Failed to modify the product information��');window.location.href='index.jsp';</script>");
        }
}
%>
