<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%><%-- 导入java.sql.ResultSet类 --%>
<%-- 创建com.tools.ConnDB类的对象 --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	/* 最新上架宠物信息 */
	ResultSet rs_new = conn.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.picture,t2.TypeName "
			+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and "
			+ "t1.newGood=1 order by t1.INTime desc");//查询最新上架宠物信息
	int new_ID = 0;//保存最新上架宠物ID的变量
	String new_goodName = "";//保存最新上架名称的变量
	float new_nowprice = 0;//保存最新上架宠物价格的变量
	String new_picture = "";//保存最新上架宠物图片的变量
	String typeName = "";//保存宠物分类的变量

	/* 打折宠物信息 */
	ResultSet rs_sale = conn
			.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.nowPrice,t1.picture,t2.TypeName "
					+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t1.sale=1 "
					+ "order by t1.INTime desc");//查询打折宠物信息
	int sale_ID = 0;//保存打折宠物ID的变量
	String s_goodname = "";//保存打折名称的变量
	float s_price = 0;//保存打折宠物的原价格的变量
	float s_nowprice = 0;//保存打折宠物的打折后价格的变量
	String s_introduce = "";//保存打折宠物简介的变量
	String s_picture = "";//保存打折宠物图片的变量
%>
<%
	/* 热门宠物信息 */
	ResultSet rs_hot = conn
			.executeQuery("select top 2 ID,GoodName,nowprice,picture " + "from tb_good order by hit desc");//查询热门宠物信息
	int hot_ID = 0;//保存热门宠物ID的变量
	String hot_goodName = "";//保存热门名称的变量
	float hot_nowprice = 0;//保存热门宠物价格的变量
	String hot_picture = "";//保存热门宠物图片的变量
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
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="general_header.jsp"%>
	<!-- //网站头部 -->
	<!-- 轮播广告及热门宠物 -->
	<div class="container B11-sl B11-sl-1">
		<div class="B11-spotlight B11-spotlight-1  row">
			<!-- 显示轮播广告 -->
			<div
				class=" col-lg-9 col-md-12  col-sm-3 hidden-sm   col-xs-6 hidden-xs " style="width: 100%;">
				<div class="B11-module module " id="Mod159">
					<div class="module-inner">
						<div class="module-ct">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="slideshow">
										<div id="slidershow" style="width: 100%;" class="nivoSlider">
											<a href="#" class="nivo-imageLink" style="display: block;"><img
												src="images/img1.png" class="img-responsive"
												style="display: none;"> </a> <a href="#"
												class="nivo-imageLink" style="display: none;"> <img
												src="images/img2.jpg" class="img-responsive"
												style="display: none;">
											</a> <a href="#" class="nivo-imageLink" style="display: none;">
												<img src="images/img3.jpg" class="img-responsive"
												style="display: none;">
											</a> <a href="#" class="nivo-imageLink" style="display: none;">
												<img src="images/img4.jpg" class="img-responsive"
												style="display: none;">
											</a>
										</div>
									</div>
									<script type="text/javascript">
										//实现调用幻灯片插件轮播广告

										jQuery(document).ready(function() {
											jQuery('#slidershow').nivoSlider();
										});
									//-->
									</script>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- //轮播广告及热门宠物  -->
	<!-- 最新上架及打折宠物展示 -->
	<nav class="container B11-masstop  hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">NEW</span>
					</h3>
					<!-- //最新上架选项卡 -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- 循环显示最新上架宠物 ：添加12条宠物信息-->
										<%
											while (rs_new.next()) {//设置一个循环
												new_ID = rs_new.getInt(1); //获取最新上架宠物的ID
												new_goodName = rs_new.getString(2); //获取最新上架宠物的名称
												new_nowprice = rs_new.getFloat(3); //获取最新上架宠物的价格
												new_picture = rs_new.getString(4); //获取最新上架宠物的图片
												typeName = rs_new.getString(5); //获取最新上架宠物的类别
										%>
										<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
											<div class="product-thumb transition">
												<div class="actions">
													<div class="image">
														<a href="goodsDetail.jsp?ID=<%=new_ID%>"> <img
															src="../images/book/<%=new_picture%>"
															alt="<%=new_goodName%>" class="img-responsive"></a>
													</div>
													<div class="button-group">
														<div class="cart">
															<button class="btn btn-primary btn-primary" type="button"
																data-toggle="tooltip"
																onclick='javascript:window.location.href="cart_add.jsp?goodID=<%=new_ID%>&num=1"; '
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
															style="color: #0885B1">good's name：</span> <%=new_goodName%></a>
													</div>
													<p class="price">
														Price：<%=new_nowprice%>Yuan
													</p>
												</div>
											</div>
										</div>
										<%
											}
										%>
										<!-- //循环显示最新上架宠物：添加12条宠物信息 -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //最新上架选项卡 -->
					<!-- 打折宠物选项卡 -->
					<h3 class="index_h3"><span class="index_title">SALE</span></h3>
					<div class="ja-tab-subcontent">
						<div class="mijoshop">
							<div class="container_oc">
								<div class="row">
									<!-- 循环显示打折宠物 ：添加12条宠物信息-->
									<%
										while (rs_sale.next()) {//设置一个循环
											sale_ID = rs_sale.getInt(1); //获取打折宠物的ID
											s_goodname = rs_sale.getString(2); //获取打折宠物的名称
											s_price = rs_sale.getFloat(3); //获取打折宠物的原价
											s_nowprice = rs_sale.getFloat(4); //获取打折宠物的现价
											s_picture = rs_sale.getString(5); //获取打折宠物的图片
											typeName = rs_sale.getString(6); //获取打折宠物的类别
									%>
									<div class="product-grid col-lg-2 col-md-3 col-sm-6 col-xs-12">
										<div class="product-thumb transition">
											<div class="actions">
												<div class="image">
													<a href="goodsDetail.jsp?ID=<%=sale_ID%> "><img
														src="../images/book/<%=s_picture%>"
														alt="<%=s_goodname%>" class="img-responsive"> </a>
												</div>
												<div class="button-group">
													<div class="cart">
														<button class="btn btn-primary btn-primary" type="button"
															data-toggle="tooltip"
															onclick='javascript:window.location.href="cart_add.jsp?goodID=<%=sale_ID%>&num=1"; '
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
														style="width: 95%"> <span style="color: #0885B1">good's name：</span><%=s_goodname%></a>
												</div>
												<div class="name" style="margin-top: 10px">
													<span style="color: #0885B1">Classification：</span><%=typeName%>
												</div>
												<span class="price"> current price：<%=s_nowprice%> Yuan
												</span><br> <span class="oldprice">original cost：<%=s_price%> Yuan
												</span>
											</div>
										</div>
									</div>
									<%
										}
									%>
									<!-- 循环显示打折宠物 ：添加12条宠物信息-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //打折宠物 选项卡-->
			</div>
		</div>
	</div>
	</nav>
	<!-- //最新上架及打折宠物展示 -->
	<!-- 版权栏 -->
	<%@ include file="general_footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>