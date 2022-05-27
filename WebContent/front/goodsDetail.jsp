<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>Online Pet Shop</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>
    <!-- Let HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">.B11-megamenu.animate .animating > .mega-dropdown-menu, .B11-megamenu.animate.slide .animating > .mega-dropdown-menu > div {
        transition-duration: 400ms !important;
        -webkit-transition-duration: 400ms !important;
    }</style>
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />
	<!-- Website header -->
	<%@ include file="general_header.jsp"%>
	<!-- //Website header -->
	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">
			<!-- Page body content -->
			<div id="B11-content"
				class="B11-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">
				<div id="B11shop" class="B11shop common-home">
					<div class="container_oc">
						<div class="row">
							<div id="content_oc" class="col-sm-12 view-product">
								<!-- Get and display information according to ID -->
								<%
									int typeSystem = 0;//A variable that holds the item type ID
									int ID = Integer.parseInt(request.getParameter("ID"));//Get product ID
									if (ID > 0) {
										ResultSet rs = conn.executeQuery("select ID,GoodName,Introduce,nowprice,picture,price,typeID "
												+ "from tb_good where ID=" + ID);//Query commodity information according to ID
										String goodName = "";//Variable to save the product name
										float nowprice = (float) 0.0;//Variable to save the current price of goods
										float price = (float) 0.0;
										String picture = "";
										String introduce = "";
										if (rs.next()) {
											goodName = rs.getString(2);//Get product name
											introduce = rs.getString(3);
											nowprice = rs.getFloat(4);
											picture = rs.getString(5);
											price = rs.getFloat(6);
											typeSystem = rs.getInt(7);
										}
										conn.close();
								%>
								<!-- Show item details -->
								<div class="row">
									<div class="col-xs-12 col-md-4 col-sm-4">
										<ul class="thumbnails" style="list-style: none">
											<li><a class="thumbnail" href="#"> <img src="../images/goods/<%=picture%>"></a></li>
										</ul>
									</div>
									<div class="col-xs-12 col-md-8 col-sm-8">
										<div style="margin-left: 30px; margin-top: 20px">
											<h1 class="product-title"><%=goodName%></h1>
											<ul class="list-unstyled price"><li><h2><%=nowprice%> Yuan</h2></li></ul>
											<ul class="list-unstyled price"><li>Original Price: <%=price%> Yuan</li></ul>
											<div id="product"><hr>
												<div class="form-group">
													<label class="control-label" for="shuliang"> Amount </label>
													<input type="number" name="quantity" value="1" size="2"
														id="shuliang" class="form-control"> <br>
													<div class="btn-group">
														<button type="button" onclick="addCart()" class="btn btn-primary btn-primary">
															<i class="B11 B11-shopping-cart"></i> add to shopping cart</button>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="col-sm-12 description_oc clearfix">
										<ul class="nav nav-tabs htabs">
											<li class="active" style="width: 150px"><a href="#tab-description" data-toggle="tab"
												aria-expanded="true">Product Description</a></li>
										</ul>
										<div class="tab-content" style="border: 1px solid #eee; overflow: hidden;">
											<div class="tab-pane active" id="tab-description">
												<%=introduce%>
											</div>
										</div>
									</div>
								</div>
								<%
									} else {
										out.println("<script language='javascript'>alert('Your operation is wrong');window.location.href='index.jsp';</script>");
									}
								%>
								<!-- //Show item details -->
								<!-- Display related products -->
								<div class="B11-module related-products">
									<h3 class="module-title ">Related Products</h3>
									<!-- Show related items at the bottom -->
									<jsp:include page="relatedGoods.jsp">
										<jsp:param name="typeSystem" value="<%=typeSystem%>" />
									</jsp:include>
									<!-- // Show related items at the bottom -->
								</div>
								<!-- //Display related products -->
								<!-- //Obtain and display product information according to ID -->
							</div>
						</div>
					</div>

				</div>
			</div>
			<!-- //Page body content -->
			<!-- Show top products on the left -->
			<jsp:include page="left_Hot-products.jsp">
				<jsp:param name="typeSystem" value="<%=typeSystem%>" />
			</jsp:include>
			<!-- // Show top products on the left -->

		</div>
	</div>

	<%@ include file="general_footer.jsp"%>

	<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
	<script type="text/javascript">
	function addCart() {
		var num = $('#shuliang').val();//Quantity of goods obtained
		if (num < 1) {
			alert('The quantity cannot be less than 1！');
			return;
		}
		window.location.href = "${pageContext.request.contextPath}/shopcart/add.action?goodID=<%=ID%>&num=" + num;//Call the add shopping cart page to add the product to the shopping cart
		}
	</script>
</body>
</html>
