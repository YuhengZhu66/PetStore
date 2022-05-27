<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<%
	StringBuffer sql = new StringBuffer();
	sql.append("select * from tb_order t1,tb_order_detail t2,tb_good t3 where 1=1 and t1.OrderID=t2.orderID and t3.ID=t2.goodID ");
	String orderId=request.getParameter("orderId");
	if( orderId!=null && !orderId.equals("0") && !orderId.equals("")){
		sql.append(" and t1.OrderID ="+Integer.parseInt(orderId)+"  ");
	}
	
	System.out.println("SQL="+sql.toString());
	ResultSet rs = conn.executeQuery(sql.toString());
	int orderID = 0;
	String username = "";
	String goodName = "";
	int gnumber = 0;
	String recevieName = "";
	String address = "";
	String tel = "";
	String orderDate = "";
	String bz = "";
	//int enforce = 0;
%>
<html>
<head>
<title>Online pet Shop�D�Dback-stage management system</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/jquery.min.js"></script>
</head>

<body> 
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
						<tr>
							<td align="right">
								&nbsp;
							</td>
							<td height="10" colspan="3">
								<form action="ordermanage.jsp" method="get" onsubmit="return search();" >
									<input type="text" placeholder="Searching by order number" name="orderId" id="orderId" />
									<input type="submit" value="Search" />
								</form>
							</td>
							<td>
								&nbsp;
							</td>
						</tr>
						<tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Order list</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <%
	String str = (String) request.getParameter("Page");
	if (str == null) {
		str = "0";
	}
	int pagesize = 10;
	rs.last();
	int RecordCount = rs.getRow();
	if(RecordCount==0){
	    %>
	    
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="10">&nbsp;</td>
        <td width="1089" align="center" style="color:#000" class="word_white"><b>No Record!</b></td>
        <td width="10">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      
    </table>
    
	    </td>
	  
	      <td width="182" valign="top">
	      
	      <table width="100%" height="431"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="199" valign="top" bgcolor="#FFFFFF"><jsp:include page="navigation.jsp"/></td>
      </tr>
    </table></td>	  
  </tr>
</table>
	    
	    <jsp:include page="page_footer.jsp"/>
</body><%
		return;
	}
	%>
	
	<!---->
   <table width="96%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
                    <tr align="center">
                      <td width="8%" height="30">Order number</td>
                      <td width="20%">Product name</td>
                      <td width="8%">Amount</td>
                      <td width="10%">Consignee</td>
                      <td width="15%">Phone number</td>
                      <td width="26%">Order date</td>
                    </tr>
<%
	int maxPage = 0;
	maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize)
			: (RecordCount / pagesize + 1);

	int Page = Integer.parseInt(str);
	if (Page < 1) {
		Page = 1;
	} else {
		if (((Page - 1) * pagesize + 1) > RecordCount) {
			Page = maxPage;
		}
	}
	rs.absolute((Page - 1) * pagesize + 1);
	for (int i = 1; i <= pagesize; i++) {
		orderID = rs.getInt("orderID");
		gnumber = rs.getInt("gnumber");
		recevieName = rs.getString("recevieName");
		goodName =rs.getString("goodName");
		goodName =rs.getString("goodName");
		tel =rs.getString("tel");
		orderDate = rs.getString("orderDate");
		orderDate=orderDate.substring(0,16);
%>
		<tr align="center">
		  <td height="24"><a href="order_detail.jsp?ID=<%=orderID%>"><%=orderID%></a></td>
		   <td><%=goodName%></td>
		   <td><%=gnumber%></td>
		  <td><%=recevieName%></td>
		  <td><%=tel%></td>
		  <td><%=orderDate%></td>
		  
		</tr>
<%
	try {
			if (!rs.next()) {
				break;
			}
		} catch (Exception e) {
		}
	}
%>
      </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="24" align="right">PageIndex��[<%=Page%>/<%=maxPage%>]&nbsp;
	<%
		if (Page > 1) {
	%>
	<a href="ordermanage.jsp?Page=1">First page</a>��<a href="ordermanage.jsp?Page=<%=Page - 1%>">Page up</a>
	<%
		}
		if (Page < maxPage) {
	%>
	��<a href="ordermanage.jsp?Page=<%=Page + 1%>">Page down</a>��<a href="ordermanage.jsp?Page=<%=maxPage%>">List page&nbsp;</a>
	<%
		}
	%>	</td>
  </tr>
</table>
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
<script>
function search(){
	var z= /^[0-9]*$/;
	if(!z.test($('#orderId').val())){
		alert('The order number is in numeric format��');
		return false;
	}
	
	return true;
}
</script>
</html>

