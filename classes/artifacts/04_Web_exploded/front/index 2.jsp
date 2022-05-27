<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<%
	/* New pet information on shelves */
	ResultSet rs_new = conn.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.picture,t2.TypeName "
			+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and "
			+ "t1.newGood=1 order by t1.INTime desc");//query
	int new_ID = 0;//Save the variable ID
	String new_goodName = "";
	float new_nowprice = 0;
	String new_picture = "";
	String typeName = "";

	/* SALE*/
	ResultSet rs_sale = conn
			.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.nowPrice,t1.picture,t2.TypeName "
					+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t1.sale=1 "
					+ "order by t1.INTime desc");
	int sale_ID = 0;
	String s_goodname = "";
	float s_price = 0;
	float s_nowprice = 0;
	String s_introduce = "";
	String s_picture = "";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>home page-pet store</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>


    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->

	<script type="text/javascript" src="./js/jquery.1.3.2.js"></script>
	<script type="text/javascript" src="./js/jquery.magnific-popup.min.js"></script>
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />
	<%@ include file="general_header.jsp"%>


	<!-- NEW and SALE pet display -->
	<nav class="container B11-masstop  hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">NEW</span>
					</h3>
					<!-- //Latest launch TAB -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- The loop shows the latest pet on the shelf-->
										<%
											while (rs_new.next()) {//loop
												new_ID = rs_new.getInt(1); //ID
												new_goodName = rs_new.getString(2);
												new_nowprice = rs_new.getFloat(3);
												new_picture = rs_new.getString(4);
												typeName = rs_new.getString(5);
										%>
										<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<div class="product-thumb transition">
												<div class="actions">
													<div class="image">
														<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <img
															src="../images/goods/<%=new_picture%>"
															alt="<%=new_goodName%>" class="img-responsive"></a>
													</div>
													<div class="button-group">
														<div class="cart">
															<button class="btn btn-primary btn-primary" type="button"
																data-toggle="tooltip"
																onclick='javascript:window.location.href="${pageContext.request.contextPath}/shopcart/add.action?goodID=<%=new_ID%>&num=1"; '
																style="display: none; width: 33.3333%;"
																data-original-title="add to the shopping cart">
																<i class="B11 B11-shopping-cart"></i>
															</button>
														</div>
													</div>
												</div>
												<div class="caption">
													<div class="name" style="height: 40px">
														<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <span
															style="color: #0885B1">good's name£º</span> <%=new_goodName%></a>
													</div>
													<p class="price">
														Price£º<%=new_nowprice%>Yuan
													</p>
												</div>
											</div>
										</div>
										<%
											}
										%>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!--Discount pets TAB -->
					<h3 class="index_h3"><span class="index_title">SALE</span></h3>
					<div class="ja-tab-subcontent">
						<div class="mijoshop">
							<div class="container_oc">
								<div class="row">

									<%
										while (rs_sale.next()) {
											sale_ID = rs_sale.getInt(1);
											s_goodname = rs_sale.getString(2);
											s_price = rs_sale.getFloat(3);
											s_nowprice = rs_sale.getFloat(4);
											s_picture = rs_sale.getString(5);
											typeName = rs_sale.getString(6);
									%>
									<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
										<div class="product-thumb transition">
											<div class="actions">
												<div class="image">
													<a href="goodsDetail.jsp?ID=<%=sale_ID%> "><img
														src="../images/goods/<%=s_picture%>"
														alt="<%=s_goodname%>" class="img-responsive"> </a>
												</div>
												<div class="button-group">
													<div class="cart">
														<button class="btn btn-primary btn-primary" type="button"
															data-toggle="tooltip"
															onclick='javascript:window.location.href="${pageContext.request.contextPath}/shopcart/add.action?goodID=<%=sale_ID%>&num=1"; '
															style="display: none; width: 33.3333%;"
															data-original-title="add to the shopping cart">
															<i class="B11 B11-shopping-cart"></i>
														</button>
													</div>
												</div>
											</div>
											<div class="caption">
												<div class="name" style="height: 40px">
													<a href="goodsDetail.jsp?ID=<%=sale_ID%>"
														style="width: 95%"> <span style="color: #0885B1">good's name£º</span><%=s_goodname%></a>
												</div>
												<div class="name" style="margin-top: 10px">
													<span style="color: #0885B1">Classification£º</span><%=typeName%>
												</div>
												<span class="price"> current price£º<%=s_nowprice%> Yuan
												</span><br> <span class="oldprice">original cost£º<%=s_price%> Yuan
												</span>
											</div>
										</div>
									</div>
									<%
										}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</nav>
	<%@ include file="general_footer.jsp"%>
</body>
</html>