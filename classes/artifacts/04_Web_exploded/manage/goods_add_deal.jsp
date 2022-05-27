<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="ins_good" scope="page" class="com.dao.GoodDaoImpl"/>
<jsp:useBean id="good" scope="page" class="com.model.Goods">
<jsp:setProperty name="good" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String goodName=chStr.chStr(good.getGoodName());
ResultSet rs=conn.executeQuery("select * from tb_good where goodname='"+goodName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('The product information has been added!');window.location.href='good_add.jsp';</script>");
}else{
	int ret=0;
        ret=ins_good.insert(good);
	if (ret!=0){
          out.println("<script language='javascript'>alert('The good information is added successfully！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('Failed to add the good information！');//window.location.href='good_add.jsp';</script>");
        }
}
%>