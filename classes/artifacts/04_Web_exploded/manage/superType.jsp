<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=conn.executeQuery("select * from tb_superType order by ID Desc");
%>
<html>
<head>
<title>PetStore�D�Dbackstage management</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script src="JS/check.js"></script>
</head>
<body> 
<jsp:include page="banner.jsp"/>
<table width="1280" height="288"  border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#FFFFFF">
  <tr>

    <td align="center" valign="top"><table width="100%"  border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="10" height="38" align="right">&nbsp;</td>
        <td colspan="3" class="tableBorder_B_dashed"><a href="super_add.jsp"> <img src="images/manage_ico1.GIF" width="11" height="13">&nbsp;[Add super category information]</a></td>
      </tr>
      <tr>
        <td align="right">&nbsp;</td>
        <td height="10" colspan="3">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td height="29" align="right">&nbsp;</td>
        <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>list of super category information</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
               <form action="${pageContext.request.contextPath}/superType/del.action" method="post" name="frm">
              <table width="92%" height="192"  border="0" cellpadding="0" cellspacing="0"> 
                <tr> 
                  <td valign="top"> <table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0"> </table> 
                    <table width="100%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#FFFFFF" bordercolorlight="#E6E6E6"> 
                      <tr bgcolor="#eeeeee"> 
                        <td height="24" align="center">Name of super category information</td>
                        <td width="8%" align="center">delete</td>
                      </tr> 
                      <%
int ID=0;
String superType="";
while(rs.next()){
	ID=rs.getInt(1);
	superType=rs.getString(2);	
%> 
                      <tr style="padding:5px;"> 
                        <td height="20" align="center"><%=superType%></td> 
                        <td align="center"><input name="delid" type="checkbox" class="noborder" value="<%=ID%>"></td> 
                      </tr> 
                      <%
}
%> 
                    </table> 
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0"> 
                      <tr> 
                        <td width="73%" height="24">&nbsp;</td> 
                        <td width="27%" align="right"><input name="checkbox" type="checkbox" class="noborder" onClick="CheckAll(frm.delid,frm.checkbox)"> 
                          [check all] [<a style="color:red;cursor:hand;" onClick="checkdel(frm.delid,frm)">delete</a>]
                          <div id="ch"> 
                            <input name="delid" type="checkbox" class="noborder" value="0"> 
                          </div></td>
                        <script language="javascript">ch.style.display="none";</script> 
                      </tr> 
                    </table></td> 
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
