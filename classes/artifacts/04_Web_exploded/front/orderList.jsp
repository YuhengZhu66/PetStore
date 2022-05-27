<%@ page language="java" contentType="text/html; charset=GBK"
		 pageEncoding="GBK"%><%@ page import="java.sql.*"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.example.shop.model.Goodelement"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<%
	String username = "";
	username = (String) session.getAttribute("username");
	if (username == "" || username == null) {
		out.println("<script language='javascript'>alert('Please log in first!');window.location.href='index.jsp';</script>");
	} else {
		ResultSet rs = conn.executeQuery(
				"select * from tb_order t1,tb_order_detail t2,tb_good t3 where t2.goodID=t3.ID and t1.OrderID=t2.orderID and t1.username='"
						+ username + "' order by t1.OrderDate desc");
		rs.last();
		int RecordCount = rs.getRow();
		if (RecordCount == 0) {
			out.println("<script language='javascript'>window.location.href='order_null.jsp';</script>");
			return;
		}
		rs.beforeFirst();
		int orderID = 0;
		int number = 0;
		String recevieName = "";
		String tel = "";
		String goodName = "";
		float price = 0;
		String orderDate = "";
%>
<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="content-type" content="text/html; charset=GBK">
	<title>My shopping cart-pet store</title>
	<link rel="stylesheet" href="css/B11-01.css" type="text/css">

	<!-- Le HTML5 shim and media query for IE8 support -->
	<!--[if lt IE 9]>
	<script type="text/javascript" src="js/html5.js"></script>
	<script type="text/javascript" src="js/respond.min.js"></script>
	<![endif]-->
	<style type="text/css">.mr-megamenu.animate .animating > .mega-dropdown-menu, .mr-megamenu.animate.slide .animating > .mega-dropdown-menu > div {
		transition-duration: 400ms !important;
		-webkit-transition-duration: 400ms !important;
	}</style>
</head>

<body>
<jsp:include page="index_log-inCon.jsp" />
<!-- 网站头部 -->
<%@ include file="general_header.jsp"%>
<!-- //网站头部 -->
<div id="mr-mainbody" class="container mr-mainbody">
	<div class="row">
		<!-- 显示订单列表 -->
		<div id="mr-content" class="mr-content col-xs-12">
			<div id="mrshop" class="mrshop common-home">
				<div class="container_oc">
					<div class="row">
						<div id="content_oc" class="col-sm-12">
							<h1>My order</h1>
							<div class="table-responsive cart-info">
								<table class="table table-bordered">
									<thead>
									<tr>
										<td class="text-center image">order number</td>
										<td class="text-center name">product name</td>
										<td class="text-center name">purchase quantity</td>
										<td class="text-center name">unit price</td>
										<td class="text-center name">sum of consumption</td>
										<td class="text-center quantity">consignee name</td>
										<td class="text-center price">consignee mobile</td>
										<td class="text-center total">date of order</td>
									</tr>
									</thead>
									<tbody>
									<%
										while (rs.next()) {
											orderID = rs.getInt("orderID");
											goodName = rs.getString("goodName");
											number = rs.getInt("number");
											recevieName = rs.getString("recevieName");
											tel = rs.getString("tel");
											price = rs.getFloat("price");
											orderDate = rs.getString("orderDate");
											orderDate = orderDate.substring(0, 16);
									%>
									<tr>
										<td class="text-center image" width="10%"><%=orderID%>
										</td>
										<td class="text-center name"><%=goodName%></td>
										<td class="text-center quantity"><%=number%>piece</td>
										<td class="text-center quantity"><%=price%>Yuan</td>
										<td class="text-center quantity"><%=number * price%>Yuan</td>
										<td class="text-center quantity"><%=recevieName%></td>
										<td class="text-center quantity"><%=tel%></td>
										<td class="text-center quantity"><%=orderDate%></td>
									</tr>
									<%
										}
									%>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<br /><br />
					<div class="row">
						<div id="content_oc" class="col-sm-12">
							<br />
							<br />
							<div class="buttons">
								<div class="pull-right">
									<a href="index.jsp" class="tigger btn btn-primary btn-primary">Continue purchase</a>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- //显示订单列表 -->
	</div>
</div>
<!-- 版权栏 -->
<%@ include file="general_footer.jsp"%>
<!-- //版权栏 -->
</body>
</html>
<%
		conn.close();
	}
%>
