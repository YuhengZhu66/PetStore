<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>

<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<%
	String type = request.getParameter("type");
	String typeName = "";
	if (type.equals("14")) {
		typeName = "a";
	}
	if (type.equals("15")) {
		typeName = "b";
	}
	if (type.equals("16")) {
		typeName = "c";
	}
	if (type.equals("17")) {
		typeName = "d";
	}

	ResultSet rs = conn
			.executeQuery("select * from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t2.superType="
					+ Integer.parseInt(type) + " order by INTime Desc");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>pet store</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">
<script src="js/jsArr01.js" type="text/javascript"></script>

    <!-- Le HTML5 shim and media query for IE8 support -->
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

	<%@ include file="general_header.jsp"%>

	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">

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
										<h1 class="b11shop_heading_h1"><%=typeName%></h1>
									</div>
									<div class="box-content">
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
															<a style="width: 95%" href="goodsDetail.jsp?ID=<%=ID%> "><img
																src="../images/goods/<%=picture%>"
																class="img-responsive"> </a>
														</div>
														<div class="button-group btn-grid">
															<div class="cart">
																<button class="btn btn-primary btn-primary"
																	type="button" data-toggle="tooltip"
																	onclick='javascript:window.location.href="${pageContext.request.contextPath}/shopcart/add.action?goodID=<%=ID%>&num=1"; '
																	style="display: none; width: 33.3333%;"
																	data-original-title="add to shopping cart">
																	<i class="B11 B11-shopping-cart"></i>
																</button>
															</div>
														</div>
													</div>
													<div>
														<div class="caption">
															<div class="name">
																<a href="goodsDetail.jsp?ID=<%=ID%>" style="width: 95%">
																	<span style="color: #0885B1">name：</span><%=goodName%></a>
															</div>

															<p class="price">
																<span class="price-new">classification：</span> <span><%=TypeName%></span>
																<span class="price-tax">price: <%=nowPrice%>Yuan
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
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												   cellpadding="0">
												<tr>
													<td height="30" align="right">pageIndex：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a href="goodsList.jsp?Page=1&type=<%=type%>">first page</a> <a
																href="goodsList.jsp?Page=<%=Page - 1%>&type=<%=type%>">Page up</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
																href="goodsList.jsp?Page=<%=Page + 1%>&type=<%=type%>">next page</a>
														<a href="goodsList.jsp?Page=<%=maxPage%>&type=<%=type%>">last page&nbsp;</a>
														<%
															}
														%>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<jsp:include page="left_Hot-products.jsp">
				<jsp:param name="type" value="<%=type%>" />
			</jsp:include>

		</div>
	</div>

	<%@ include file="general_footer.jsp"%>

</body>
</html>