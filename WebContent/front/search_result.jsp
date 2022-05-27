<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.example.shop.tools.ChStr" />
<%
	String searchword = request.getParameter("searchword");
	searchword = chStr.chStr(searchword);
	ResultSet rs = conn.executeQuery(
			"select * from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t1.goodName like '%"
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
	<%@ include file="general_header.jsp"%>
	<div id="mr-mainbody" class="container mr-mainbody">
		<div class="row">

			<div id="mr-content"
				class="mr-content col-xs-12 col-sm-12 col-md-9 col-md-push-3">

				<div id="system-message-container" style="display: none;"></div>

				<div id="mrshop" class="mrshop common-home">
					<div class="container_oc">
						<ul class="breadcrumb">
						</ul>
						<div class="row">
							<div id="content_oc" class="col-sm-12">
								<div class="box_oc">
									<div class="box-heading">
										<h1 class="mrshop_heading_h1">search result</h1>
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
													String goodsName = rs.getString("goodName");
													String introduce = rs.getString("introduce");
													String picture = rs.getString("picture");
													String TypeName = rs.getString("TypeName");
													float nowPrice = rs.getFloat("nowPrice");
													String newGoods = rs.getInt("newgood") == 0 ? "no" : "yes";
													String sale = rs.getInt("sale") == 0 ? "no" : "yes";
											%>
											<div
												class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
												<div class="product-thumb">
													<div class="actions">
														<div class="image">
															<a href="goodsDetail.jsp?ID=<%=ID%> "><img
																src="../images/goods/<%=picture%>"
																class="img-responsive"> </a>
														</div>
														<div class="button-group btn-grid">
															<div class="cart">
																<button class="btn btn-primary btn-primary"
																	type="button" data-toggle="tooltip"
																	onclick='javascript:window.location.href="cart_add.jsp?goodsID=<%=ID%>&num=1"; '
																	style="display: none; width: 33.3333%;"
																	data-original-title="add to Shopping Cart">
																	<i class="fa fa-shopping-cart"></i>
																</button>
															</div>
														</div>
													</div>
													<div>
														<div class="caption">
															<div class="name">
																<a href="goodsDetail.jsp?ID=<%=ID%>" style="width: 95%">
																	<span style="color: #0885B1">Name：</span><%=goodsName%></a>
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
										<div class="row pagination">
											<table width="100%" border="0" cellspacing="0"
												   cellpadding="0">
												<tr>
													<td height="30" align="right">pageIndex：[<%=Page%>/<%=maxPage%>]&nbsp;
														<%
															if (Page > 1) {
														%> <a
																href="search_result.jsp?Page=1&searchword=<%=searchword%>">first page</a>
														<a
																href="search_result.jsp?Page=<%=Page - 1%>&searchword=<%=searchword%>">Page up</a>
														<%
															}
															if (Page < maxPage) {
														%> <a
																href="search_result.jsp?Page=<%=Page + 1%>&searchword=<%=searchword%>">next page</a>
														<a
																href="search_result.jsp?Page=<%=maxPage%>&searchword=<%=searchword%>">last page&nbsp;</a>
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
			<jsp:include page="left_Hot-products.jsp" />

		</div>
	</div>
	<%@ include file="general_footer.jsp"%>
</body>
</html>