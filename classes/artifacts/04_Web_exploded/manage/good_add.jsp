<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<%
ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
int superID=-1;
String superName="";
if(rs_super.next()){
	superID=rs_super.getInt(1);
}else{
	out.println("<script language='javascript'>alert('Please input the category information first!');window.location.href='index.jsp';</script>");
	return;
}
%>
<html>
<head>
<title>Online Pet Shop――backstage management</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/jquery.min.js"></script>
<script language="javascript">
/***************************调用函数*************************/
$(document).ready(function(){
	selSubType(<%=superID%>);
});

function selSubType(val){

$.get("selSubType.jsp",
		{superID:val},
		function(data){
			$("#subType").html(data);
});
}
</script>
</head>
<script language="javascript">
function mycheck(){
	if (form1.goodName.value==""){
		alert("Please enter the name of the product！");form1.goodName.focus();return;
	}
	if (form1.picture.value==""){
		alert("Please enter the path of the image file！");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("Please enter good pricing！");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("The pricing you entered is wrong, please re-enter！");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("Please enter good introduction！");form1.introduce.focus();return;
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
          <td colspan="3" class="tableBorder_B_dashed"><img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="good_add.jsp">[Adding Product Information]</a></td>
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
          <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Adding Product Information</b></td>
          <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
      <!---->
       			  			  <form action="goods_add_deal.jsp" method="post" name="form1">
			    <table width="94%"  border="0" align="center" cellpadding="0" cellspacing="0" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;Product name：</td>
                    <td height="27" colspan="3">&nbsp;
                      <input name="goodName" type="text" class="Sytle_text" id="goodID2" size="50">&nbsp;&nbsp;  </td>
                  </tr>				
                  <tr>
                    <td height="27">&nbsp;Parent category：</td>
                    <td width="31%" height="27">&nbsp;
                      <select name="supertype" class="textarea" id="supertype" onChange="selSubType(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    <td width="13%" height="27"> &nbsp;Subcategory：</td>
                    <td width="42%" height="27" id="subType">Calling triage information……</td>
                  </tr>
                  <tr>
                    <td height="41">&nbsp;Picture file：</td>
                    <td height="41">&nbsp;
                          <input name="picture" type="text" class="Style_upload" id="picture">
                    </td>
                    <td height="41">&nbsp;Pricing：</td>
                    <td height="41">
                          <span style="float:left;"><input name="price" type="text" class="Sytle_text" id="price"></span><span  style="float:left;padding-top:10px;">&nbsp;(Yuan)</span></td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;New or not：</td>
                    <td>&nbsp; <input name="newgood" type="radio" class="noborder" value="1" checked>
是
  <input name="newgood" type="radio" class="noborder" value="0">
否</td>
                    <td>&nbsp;On sales or not：</td>
                    <td><input name="sale" type="radio" class="noborder" value="1" checked>
是
  <input name="sale" type="radio" class="noborder" value="0">
否</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;Product introduction：</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" style="height:180px;" id="introduce"></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_bg_short" value="Saved" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_bg_short" value="Reset">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="Back" onClick="JScript:history.back(-1)">
                    </td>
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
