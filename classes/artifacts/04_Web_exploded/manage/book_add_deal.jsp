<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<jsp:useBean id="ins_book" scope="page" class="com.dao.GoodDaoImpl"/>
<jsp:useBean id="book" scope="page" class="com.model.Book">
<jsp:setProperty name="book" property="*"/>
</jsp:useBean>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr"/>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
String goodName=chStr.chStr(book.getGoodName());
ResultSet rs=conn.executeQuery("select * from tb_good where goodName='"+goodName+"'");
if (rs.next()){
	out.println("<script language='javascript'>alert('该宠物信息已经添加！');window.location.href='book_add.jsp';</script>");
}else{
	int ret=0;
        ret=ins_book.insert(book);
	if (ret!=0){
          out.println("<script language='javascript'>alert('宠物信息添加成功！');window.location.href='index.jsp';</script>");
        }else{
          out.println("<script language='javascript'>alert('宠物信息添加失败！');//window.location.href='book_add.jsp';</script>");
        }
}
%>