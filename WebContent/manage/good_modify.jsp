<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<%
String PID="";
String goodname="";
int superID1=-1;
int subID1=-1;
String introduce="";
String picture="";
float price=0f;
float nowprice=0f;
int sale=0;
int newgood=0;
PID=request.getParameter("ID");
if (PID!=null && PID!=""){
	int ID=Integer.parseInt(PID);
	ResultSet rs=conn.executeQuery("select * from tb_good where ID="+ID);
	if(!rs.next()){
		out.println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='index.jsp';</script>");
	}else{
//		superID1=rs.getInt("superID");
//		subID1=rs.getInt("subID");
		goodname=rs.getString("goodname");
		introduce=rs.getString("introduce");
		price=rs.getFloat("Price");		
		nowprice=rs.getFloat("nowPrice");		
		picture=rs.getString("picture");
		newgood=rs.getInt("newgood");
		sale=rs.getInt("sale");
	}
	ResultSet rs_super=conn.executeQuery("select ID,superType from V_type group by ID,superType");
	int superID=-1;
	String superName="";
	if(!rs_super.next()){
		out.println("<script language='javascript'>alert('Please input the category information first!');window.location.href='index.jsp';</script>");
		return;
	}
%>
<html>
<head>
<title>Online Pet Shop�D�Dbackstage management</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
<script language="javascript" src="JS/jquery.min.js"></script>
<script language="javascript">
/***************************���ú���*************************/
$(document).ready(function(){
	selSubType(<%=superID1%>);
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
		alert("Please enter the name of the product��");form1.goodName.focus();return;
	}
	if (form1.picture.value==""){
		alert("Please enter the path of the image file��");form1.picture.focus();return;
	}
	if (form1.price.value==""){
		alert("Please enter good pricing��");form1.price.focus();return;
	}
	if (isNaN(form1.price.value)){
		alert("The pricing you entered is wrong, please re-enter��");form1.price.value="";form1.price.focus();return;
	}	
	if (form1.introduce.value==""){
		alert("Please enter good introduction��");form1.introduce.focus();return;
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
        <td colspan="3" class="tableBorder_B_dashed">&nbsp;&nbsp;<img src="images/manage_ico3.GIF" width="12" height="12">&nbsp;<a href="goods_add.jsp">[Adding Product Information]</a></td>
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
        <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Modifying Product Information</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
      			 <form action="${pageContext.request.contextPath}/goods/modify.action" method="post" name="form1">
			    <table width="94%"  border="0" align="right" cellpadding="-2" cellspacing="-2" bordercolordark="#FFFFFF">
                  <tr>
                    <td width="14%" height="27">&nbsp;Product name��
                      <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
                    <td height="27" colspan="3">&nbsp;
                      <input name="goodName" type="text" class="Sytle_text" value="<%=goodname%>" size="50">
                      &nbsp;&nbsp;                    </td>
                  </tr>
                  <tr>
                    <td height="27">&nbsp;Parent category��</td>
                    <td width="31%" height="27">&nbsp;
                      <select name="supertype" class="textarea" id="supertype"  onChange="selSubType(this.value)">
					  <%rs_super.first();
					  do{
						  superID=rs_super.getInt(1);
						  superName=rs_super.getString(2);
					  %>
					  <option value="<%=superID%>"<%if(superID==superID1){out.println(" selected");}%>><%=superName%></option>
					  <%}while(rs_super.next());%>
                      </select></td>
                    <td width="13%" height="27"> &nbsp;Subcategory��</td>
                    <td width="42%" height="27" id="subType">Calling triage information����</td>
                  </tr>
                  <tr>
                    <td height="16">&nbsp;Picture file��</td>
                    <td height="27" colspan="3">&nbsp;
                        <input name="picture" type="text" class="Style_upload" id="picture" value="<%=picture%>" size="30"> 
                        (Only the path of the image file)                         </td>
                  </tr>
                  <tr>
                    <td height="27" align="center">Pricing��</td>
                    <td height="27"><span style="float:left;"><input name="price" type="text" class="Sytle_text" id="price3" value="<%=price%>" size="14"></span><span  style="float:left;padding-top:10px;">&nbsp;(Yuan)</span>
                    </td><td height="27" align="center">Current Price�� </td>
                    <td height="27"><span style="float:left;"><input name="nowPrice" type="text" class="Sytle_text" id="price4" value="<%=nowprice%>" size="14">
</span><span  style="float:left;padding-top:10px;">&nbsp;(Yuan)</span></td>
                  </tr>
                  <tr>
                    <td height="45">&nbsp;New or not��</td>
                    <td>&nbsp; <input name="newGood" type="radio" class="noborder" value="1"<%if(newgood==1){out.print(" checked");}%>>
��
  <input name="newGood" type="radio" class="noborder" value="0"<%if(newgood==0){out.print(" checked");}%>>
��</td>
                    <td>&nbsp;On sales or not��</td>
                    <td><input name="sale" type="radio" class="noborder" value="1"<%if(sale==1){out.print(" checked");}%>>
��
  <input name="sale" type="radio" class="noborder" value="0"<%if(sale==0){out.print(" checked");}%>>
��</td>
                  </tr>
                  <tr>
                    <td height="103">&nbsp;Product introduction��</td>
                    <td colspan="3"><span class="style5">&nbsp; </span>
                        <textarea name="introduce" cols="60" rows="5" class="textarea" id="introduce" style="height:180px"><%=introduce%></textarea></td>
                  </tr>
                  <tr>
                    <td height="38" colspan="4" align="center">
                        <input name="Button" type="button" class="btn_bg_short" value="Saved" onClick="mycheck()">
&nbsp;                        
<input name="Submit2" type="reset" class="btn_bg_short" value="Reset">
                        &nbsp;
                        <input name="Submit3" type="button" class="btn_bg_short" value="Back" onClick="JScript:history.back()">
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

<%}else{
	out.println("<script language='javascript'>alert('Your operation is wrong!');window.location.href='index.jsp';");
}%>