<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*" errorPage="" %>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB"/>
<jsp:include page="safe.jsp"/>
<%
ResultSet rs=conn.executeQuery("select * from tb_Member");
%>
<html>
<head>
<title>Online pet Shop?D?Dback-stage management system</title>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<link href="CSS/style.css" rel="stylesheet">
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
        <td height="29" align="right">&nbsp;</td>
        <td width="10" background="images/manage_leftTitle_left.GIF">&nbsp;</td>
        <td width="1089" align="center" background="images/manage_leftTitle_mid.GIF" class="word_white"><b>Member list</b></td>
        <td width="10" background="images/manage_leftTitle_right.GIF">&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
	<!---->
<table width="100%" height="14"  border="0" cellpadding="0" cellspacing="0">
            <tr>
              <td height="13" align="center">&nbsp;</td>
            </tr>
      </table>
            <table width="96%" height="48"  border="1" cellpadding="0" cellspacing="0" bordercolor="#FFFFFF" bordercolordark="#CCCCCC" bordercolorlight="#FFFFFF">
              <tr>
                <td width="14%" height="27" align="center">
                    Username</td>
                <td width="14%" align="center">Real name</td>
                
                <td width="14%" align="center">Phone number</td>
                <td width="26%" align="center">Email</td>
                <td width="10%" align="center">Consumption</td>
              </tr>
<%
String str=(String)request.getParameter("Page");
if(str==null){
	str="0";
}
int pagesize=10;
rs.last();
int RecordCount=rs.getRow(); 
int maxPage=0;
maxPage=(RecordCount%pagesize==0)?(RecordCount/pagesize):(RecordCount/pagesize+1);

int Page=Integer.parseInt(str);
if(Page<1){
	Page=1;
}else{
	if(((Page-1)*pagesize+1)>RecordCount){
		Page=maxPage;
	}
}
rs.absolute((Page-1)*pagesize+1);
for(int i=1;i<=pagesize;i++){
	  int ID=rs.getInt("ID");
	  String username=rs.getString("username");
	  String Truename=rs.getString("Truename");
	  String city=rs.getString("city");
	  String CardNO=rs.getString("CardNO");
	  String CardType=rs.getString("CardType");	  
	  float Amount=rs.getFloat("Amount");
	  String Tel=rs.getString("Tel");	
	  String Email=rs.getString("Email");	
	  int freeze=rs.getInt("freeze"); 
	  %>

              <tr style="padding:5px;">
                <td height="24" align="center"><a href="member_detail.jsp?ID=<%=ID%>"><%=username%></a>&nbsp;</td>
                <td align="center"><%=Truename%>&nbsp;</td>
                
                <td align="center"><%=Tel%>&nbsp;</td>
                <td align="center"><%=Email%>&nbsp;</td>
                <td align="center"><%=Amount%></td>
                
              </tr>
<%
	try{
		if(!rs.next()){break;}
		}catch(Exception e){}
}
%>
      </table>
<table width="100%"  border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="27" align="right">PageIndex??[<%=Page%>/<%=maxPage%>]&nbsp;
	<%if(Page>1){%>
	<a href="membermanage.jsp?Page=1">First page</a>??<a href="membermanage.jsp?Page=<%=Page-1%>">Page up</a>
	<%
	}
	if(Page<maxPage){
	%>
	??<a href="membermanage.jsp?Page=<%=Page+1%>">Page down</a>??<a href="membermanage.jsp?Page=<%=maxPage%>">List page&nbsp;</a>
	<%}
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
</html>
