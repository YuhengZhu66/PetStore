<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<%
ResultSet rs=conn.executeQuery("select * from tb_superType order by ID Desc");
%>
<html>
<head>
<title>PetStore――backstage management</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
</head>
<script language="javascript">
function mycheck(){
	if (form1.typename.value==""){
		alert("Please enter a sub category name!");form1.typename.focus();return;
	}
	form1.submit();
}
</script>
<body>  
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed"><img src="images/manage_ico2.GIF" width="11" height="11">&nbsp;<a href="subType.jsp">[Sub category information management]</a></td>
        <td width="12">&nbsp;</td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Add subcategory information</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
      			  <form action="${pageContext.request.contextPath}/subType/add.action" method="post" name="form1">
			    <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td height="50">Select category belong to：</td>
					<td height="50"><select name="superid">
					<%
					int id=0;
					String typename="";
					while(rs.next()){
					id=rs.getInt("ID");
					typename=rs.getString("typename");
					%>
					  <option value="<%=id%>"><%=typename%></option>
					  <%}%>
					  </select></td>
                  </tr> 
				  <tr>
                    <td width="17%" height="50">Subcategory name：</td>
                    <td width="83%" height="50"><input name="typename" type="text" id="typename" size="60"></td>
                  </tr>
                  <tr align="center">
                    <td height="38" colspan="3">
                        <input name="Button" type="button" class="btn_bg_short" value="Save" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_bg_short" value="Reset">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="Back" onClick="JScript:window.location.href='subType.jsp';">                    </td>
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
