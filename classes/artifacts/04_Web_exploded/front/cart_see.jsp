<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Vector"%><
<%@ page import="java.text.DecimalFormat"%>
<%@ page import="com.example.shop.model.Goodelement"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<%
	String username = (String) session.getAttribute("username");
	//If you have not logged in, the login page is displayed
	if (username == "" || username == null) {
		response.sendRedirect("login.jsp");
		return;
	} else {
		Vector cart = (Vector) session.getAttribute("cart");
		if (cart == null || cart.size() == 0) {
			response.sendRedirect("cart_null.jsp");
		} else {
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>My shopping cart-Online Pet Shop</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">
	<script type="text/javascript" src="${pageContext.request.contextPath}/front/js/jquery.1.3.2.js"></script>
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />

	<%@ include file="general_header.jsp"%>

	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">
			<!-- body -->
			<div id="B11-content" class="B11-content col-xs-12">
				<div id="B11shop" class="B11shop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>My shopping cart</h1>

								<div class="table-responsive cart-info">
									<table class="table table-bordered">
										<thead>
											<tr>
												<td class="text-center image">Commodity Images</td>
												<td class="text-left name">Trade Name</td>
												<td class="text-left quantity">Amount</td>
												<td class="text-right price">Unit Price </td>
												<td class="text-right total">total</td>
											</tr>
										</thead>
										<tbody>
										<!-- Walk through the cart and display the pet goods-->
											<%
												float sum = 0;
												DecimalFormat fnum = new DecimalFormat("##0.0");//Defines the format for displaying the amount
												int ID = -1;//Save the pet ID variable
												String goodName = "";//Holds a variable for the good name
												String picture = "";
												//Walk through the goods in the cart
												for (int i = 0; i < cart.size(); i++) {
													Goodelement gooditem = (Goodelement) cart.elementAt(i);
													sum = sum + gooditem.number * gooditem.nowprice;
													ID = gooditem.ID;
													if (ID > 0) {
														ResultSet rs_good = conn.executeQuery("select * from tb_good where ID=" + ID);
														if (rs_good.next()) {
															goodName = rs_good.getString("goodName");
															picture = rs_good.getString("picture");
														}
														conn.close();
													}
											%>
											<!-- Displays a good message -->
											<tr>
												<td class="text-center image" width="20%"><a href="goodsDetail.jsp?ID=<%=gooditem.ID%>">
													<img width="80px" src="../images/goods/<%=picture%>"> </a></td>
												<td class="text-left name"><a
													href="goodsDetail.jsp?ID=<%=gooditem.ID%>"> <%=goodName%></a>
												</td>
												<td class="text-left quantity"><%=gooditem.number%></td>
												<td class="text-right price"><%=gooditem.nowprice%>Yuan</td>
												<td class="text-right total"><%=(gooditem.nowprice * gooditem.number)%>Yuan
												</td>
											</tr>

											<%
												}
												String sumString = fnum.format(sum);//Formatted total amount
											%>

										</tbody>
									</table>
								</div>

								<div class="row cart-total">
									<div class="col-sm-4 col-sm-offset-8">
										<table class="table table-bordered">
											<tbody>
												<tr >
												<span>
													<strong>Total Amount:</strong>
													<p><%=sumString%>Yuan</p>
												</span>
												</tr>
											</tbody>
										</table>
									</div>
								</div>

							</div>
						</div>

						<!-- logistics information -->
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>Logistics Information</h1>
								<!-- table -->
								<form action="${pageContext.request.contextPath}/shopcart/order.action" method="post" id="myform">
									<div class="table-responsive cart-info">
										<table class="table table-bordered">
											<tbody>
												<tr>
													<td class="text-right" width="20%">Consignee Name：</td>
													<td class="text-left quantity">
														<div class="input-group btn-block" style="max-width: 400px;">
															<input type="text" id="recevieName" name="recevieName" size="10" class="form-control">
														</div>
													</td>
												</tr>
												<tr>
													<td class="text-right">Consignee's Phone Number：</td>
													<td class="text-left quantity">
														<div class="input-group btn-block" style="max-width: 400px;">
															<input type="text" id="tel" name="tel" size="10" class="form-control">
														</div>
													</td>
												</tr>
												<tr>
													<td class="text-right">Consignee's Address：</td>
													<td class="text-left quantity">
														<div class="input-group btn-block" style="max-width: 400px;">
															<input type="text" id="address" name="address" size="1" class="form-control">
														</div>
													</td>
												</tr>
												<tr>
													<td class="text-right">Remark：</td>
													<td class="text-left quantity">
														<div class="input-group btn-block" style="max-width: 400px;">
															<input type="text" name="bz" size="1" class="form-control">
														</div>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
								</form>

							</div>
						</div>

						<br />
						<!-- PAY -->
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<h1>Terms of Payment</h1>
								<div class="table-responsive cart-info">
									<table class="table table-bordered">
										<tbody>
											<tr>
												<td class="text-left"><img src="images/zhifubao.png" /></td>
											</tr>
										</tbody>
									</table>
								</div>
								<br /> <br />
								<div class="buttons">
									<div class="pull-left">
										<a href="index.jsp" class="btn btn-primary btn-default">Continue Shopping</a>
									</div>
									<div class="pull-left">
										<a href="${pageContext.request.contextPath}/shopcart/clear.action" class="btn btn-primary btn-default">Empty Shopping Cart</a>
									</div>
									<div class="pull-right">
										<a href="javascript:zhifu();" class="tigger btn btn-primary btn-primary">Settle accounts</a>
									</div>
								</div>
							</div>
						</div>

					</div>
				</div>
			</div>

		</div>
	</div>

	<%@ include file="general_footer.jsp"%>


	<!-- Implement a payment dialog -->
	<script type="text/javascript" src="js/jBox/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="js/jBox/jquery.jBox-2.3.min.js"></script>
	<link type="text/css" rel="stylesheet" href="js/jBox/Skins2/Pink/jbox.css" />
	<script type="text/javascript">
		function zhifu() {
			//Verify consignee name
			if ($('#recevieName').val() === "") {
				alert('The name of the consignee cannot be blank！');
				return;
			}

			if ($('#tel').val() === "") {
				alert('Consignee\'s  phone number should not be empty！');
				return;
			}

			if (isNaN($('#tel').val())) {
				alert("Please enter a number for your phone number!");
				return;
			}

			if ($('#address').val() === "") {
				alert('The consignee address cannot be empty！');
				return;
			}
			//Sets what to display
			var html = '<div class="popup_cont">'
					+ '<p>Scan QR code for payment</p>'
					+ '<strong>￥ id="show_money_info">0.01Yuan</strong>'
					+ '<div style="width: 256px; height: 250px; text-align: center; margin-left: auto; margin-right: auto;" >'
					+ '<image src="images/QRcodetesting.png" width="256" height="256" /></div>'
					+ '</div><p style="text-align:center"> The payment QR code is for testing purposes only </p>';
			var content = {
				state1 : {
					content : html,
					buttons : {
						'CANCEL' : 0,
						'Pay' : 1
					},
					buttonsFocus : 0,
					submit : function(v, h, f) {
						if (v == 0) {//cancel button
							return true; //close
						}
						if (v == 1) {//pay button
							document.getElementById('myform').submit();//Submit Form
							return true;
						}
						return false;
					}
				}
			};
			$.jBox.open(content, 'PAY', 400, 450);//open PAY
		}
	</script>

</body>
</html>
<%	}
		}
%>
