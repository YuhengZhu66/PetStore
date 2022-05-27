<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<%
String PID="";
String goodname="";
String superType="";
String subType="";
String introduce="";
String picture="";
float price=(float)0.0;
float nowprice=(float)0.0;
int sale=0;
int newgood=0;
PID=request.getParameter("ID");
if (PID!=null && PID!=""){
	int ID=Integer.parseInt(PID);
	ResultSet rs=conn.executeQuery("select * from tb_good where ID="+ID);
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='index.jsp';</script>");
	}else{
		goodname=rs.getString("goodname");
		introduce=rs.getString("introduce");
		price=rs.getFloat("Price");		
		nowprice=rs.getFloat("nowPrice");		
		picture=rs.getString("picture");
		newgood=rs.getInt("newgood");
		sale=rs.getInt("sale");
	}
%>
<html>
<head>
<title>Online pet shop¨D¨Dback-stage management</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
</head>
<body>
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed">&nbsp;&nbsp;&nbsp;<img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[Adding Product Information]</a></td>
        <td width="12">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="19" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1070" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Delete product information</b></td>
        <td width="20" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
      			 <form action="${pageContext.request.contextPath}/goods/del.action" method="post" name="form1">
			    <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;Product name£º</td>
                    <td height="27" colspan="3">&nbsp;
					<input name="ID" type="hidden" id="ID" value="<%=ID%>">
                      <%=goodname%>
                      &nbsp;&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;Parent category£º</td>
                    <td width="31%" height="27">&nbsp;<%=superType%></td>
                    <td width="13%" height="27"> &nbsp;Subcategory£º</td>
                    <td width="42%" height="27">&nbsp;<%=subType%></td>
                  </tr>
                  <tr>
                    <td height="16">&nbsp;Picture file£º</td>
                    <td height="27" colspan="3">&nbsp;
                       <%=picture%></td>
                  </tr>
                  <tr>
                    <td height="27" align="center">Pricing£º</td>
                    <td height="27">&nbsp;<%=price%>(Yuan)</td><td height="27" align="center">Current price£º </td>
                    <td height="27">&nbsp;<%=nowprice%>(Yuan)</td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;New or not£º</td>
                    <td>&nbsp; <%if(newgood==0){out.print("Not");}
					else{out.print("Yes");}
					%></td>
                    <td>&nbsp;On sales or not£º</td>
                    <td><%if(sale==0){out.print("Not on sales");}
					else{out.print("On sales");}
					%></td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;Product introduction£º</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <%=introduce%></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Submit" type="submit" class="btn_bg_long1" value=" Delect">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="Back" onClick="JScript:history.back()">                    </td>
                  </tr>
                </table>
			  </form>
	 <!----> 
</td>
	  
	      <td width="182" valign="top"><table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
<jsp:include page="page_footer.jsp"/>
</body>
</html>
<%}else{
	out.println("<script language='javascript'>alert('Your operation is wrong!');window.location.href='index.jsp';");
}%>