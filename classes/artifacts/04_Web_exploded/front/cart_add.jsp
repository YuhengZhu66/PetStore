<%@ page language="java" contentType="text/html; charset=GBK"
    pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodelement"%>
<%@ page import="java.sql.SQLException" %>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	String username=(String)session.getAttribute("username");
	String num = (String) request.getParameter("num");
	//If you have not logged in, the login page is displayed
	if (username == null || username == "") {
		response.sendRedirect("login.jsp");//Redirect the page to the member login page
		return;
	}

	int ID = Integer.parseInt(request.getParameter("goodID"));
	String sql = "select * from tb_good where ID=" + ID;//Define the SQL statement to query the product information according to the ID
	ResultSet rs = conn.executeQuery(sql);//Query by ID
	float nowprice = 0;//Defines the variable that holds the commodity price
	try {
		if (rs.next()) {
			nowprice = rs.getFloat("nowprice");
		}
	} catch (SQLException e) {
		throw new RuntimeException(e);
	}
	Goodelement myelement = new Goodelement();//Create the object mygoodelement of the model class that holds the product information in the shopping cart
	myelement.ID = ID;//Save ID to mygoodelement object
	myelement.nowprice = nowprice;
	myelement.number = Integer.parseInt(num);
	boolean Flag = true;//Record whether the goods to be added already exist in the shopping cart
	Vector cart = (Vector) session.getAttribute("cart");//Get shopping cart object
	if (cart == null) {
		cart = new Vector();
	} else {
		//Determine whether the goods already exist in the shopping cart
		for (int i = 0; i < cart.size(); i++) {
			Goodelement Item = (Goodelement) cart.elementAt(i);
			if (Item.ID == myelement.ID) {
				Item.number = Item.number + myelement.number;
				cart.setElementAt(Item, i);
				Flag = false;//Set the Flag variable to false to indicate that the good exists in the shopping cart
			}
		}
	}
	if (Flag)//If the good does not exist in the shopping cart
		cart.addElement(myelement);//Store the goods to be purchased in the shopping cart
	session.setAttribute("cart", cart);//Add the shopping cart object to the Session
	conn.close();
	response.sendRedirect("cart_see.jsp");
%>
</body>
</html>