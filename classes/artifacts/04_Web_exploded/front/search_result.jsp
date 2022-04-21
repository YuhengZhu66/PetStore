<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%><!-- 导入java.sql.ResultSet类 -->
<!-- 创建com.tools.ConnDB类的对象 -->
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" /><!-- 创建ChStr类的对象 -->
<%
	String searchword = request.getParameter("searchword");
	searchword = chStr.chStr(searchword);
	ResultSet rs = conn.executeQuery(
			"select * from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t1.GoodName like '%"
					+ searchword + "%' order by INTime Desc");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>List-pet store</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />
	<!-- 网站头部 -->
	<%@ include file="general_header.jsp"%>
	<!-- //网站头部 -->
	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">

			<!-- 显示搜索到的宠物列表 -->
			<div id="B11-content"
				class="B11-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">

				<div id="system-message-container" style="display: none;"></div>

				<div id="b11shop" class="b11shop common-home">
					<div class="container_oc">
						<ul class="breadcrumb">
						</ul>
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<div class="box_oc">
									<div class="box-heading">
										<h1 class="b11shop_heading_h1">search result</h1>
									</div>
									<div class="box-content1">
										<hr>
										<div class="row">
											<%
												String str = (String) request.getParameter("Page");
												if (str == null) {
													str = "0";
												}
												int pagesize = 12;
												rs.last();
												int RecordCount = rs.getRow();

												if (RecordCount == 0) {
													out.println(
															"<script language='javascript'>alert('Search no record!');window.location.href='index.jsp';</script>");
													return;
												}
												int maxPage = 0;
												maxPage = (RecordCount % pagesize == 0) ? (RecordCount / pagesize) : (RecordCount / pagesize + 1);

												int Page = Integer.parseInt(str);
												if (Page < 1) {
													Page = 1;
												} else {
													if (Page > maxPage) {
														Page = maxPage;
													}
												}
												rs.absolute((Page - 1) * pagesize + 1);
												for (int i = 1; i <= pagesize; i++) {
													int ID = rs.getInt("ID");
													String goodName = rs.getString("goodName");
													String introduce = rs.getString("introduce");
													String picture = rs.getString("picture");
													String TypeName = rs.getString("TypeName");
													float nowPrice = rs.getFloat("nowPrice");
													String newGood = rs.getInt("newGood") == 0 ? "no" : "yes";
													String sale = rs.getInt("sale") == 0 ? "no" : "yes";
											%>
											<div
												class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="product-thumb">
													<div class="actions">
														<div class="image">
															<a href="goodsDetail.jsp?ID=<%=ID%> "><img
																src="../images/book/<%=picture%>"
																class="img-responsive"> </a>
														</div>
														<div class="button-group btn-grid">
															<div class="cart">
																<button class="btn btn-primary btn-primary"
																	type="button" data-toggle="tooltip"
																	onclick='javascript:window.location.href="cart_add.jsp?goodID=<%=ID%>&num=1"; '
																	style="display: none; width: 33.3333%;"
																	data-original-title="add to Shopping Cart">
																	<i class="B11 B11-shopping-cart"></i>
																</button>
															</div>
														</div>
													</div>
													<div>
														<div class="caption">
															<div class="name">
																<a href="goodsDetail.jsp?ID=<%=ID%>" style="width: 95%">
																	<span style="color: #0885B1">Name：</span><%=goodName%></a>
															</div>
															<p class="price">
																<span class="price-new">classification：</span> <span><%=TypeName%></span>
																<span class="price-tax">Price: <%=nowPrice%>Yuan
																</span>
															</p>
														</div>

													</div>
												</div>
											</div>
											<%
												try {
														if (!rs.next()) {
															break;
														}
													} catch (Exception e) {
													}
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
			<!-- //显示搜索到的宠物列表-->
			<!-- 显示左侧热门宠物 -->
			<jsp:include page="left_Hot-products.jsp" />
			<!-- // 显示左侧热门宠物 -->

		</div>
	</div>
	<!-- 版权栏 -->
	<%@ include file="general_footer.jsp"%>
	<!-- //版权栏 -->
</body>
</html>