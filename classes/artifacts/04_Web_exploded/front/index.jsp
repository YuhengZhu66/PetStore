<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%><%-- ����java.sql.ResultSet�� --%>
<%-- ����com.tools.ConnDB��Ķ��� --%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	/* �����ϼܳ�����Ϣ */
	ResultSet rs_new = conn.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.picture,t2.TypeName "
			+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and "
			+ "t1.newGood=1 order by t1.INTime desc");//��ѯ�����ϼܳ�����Ϣ
	int new_ID = 0;//���������ϼܳ���ID�ı���
	String new_goodName = "";//���������ϼ����Ƶı���
	float new_nowprice = 0;//���������ϼܳ���۸�ı���
	String new_picture = "";//���������ϼܳ���ͼƬ�ı���
	String typeName = "";//����������ı���

	/* ���۳�����Ϣ */
	ResultSet rs_sale = conn
			.executeQuery("select top 12 t1.ID, t1.GoodName,t1.price,t1.nowPrice,t1.picture,t2.TypeName "
					+ "from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t1.sale=1 "
					+ "order by t1.INTime desc");//��ѯ���۳�����Ϣ
	int sale_ID = 0;//������۳���ID�ı���
	String s_goodname = "";//����������Ƶı���
	float s_price = 0;//������۳����ԭ�۸�ı���
	float s_nowprice = 0;//������۳���Ĵ��ۺ�۸�ı���
	String s_introduce = "";//������۳�����ı���
	String s_picture = "";//������۳���ͼƬ�ı���
%>
<%
	/* ���ų�����Ϣ */
	ResultSet rs_hot = conn
			.executeQuery("select top 2 ID,GoodName,nowprice,picture " + "from tb_good order by hit desc");//��ѯ���ų�����Ϣ
	int hot_ID = 0;//�������ų���ID�ı���
	String hot_goodName = "";//�����������Ƶı���
	float hot_nowprice = 0;//�������ų���۸�ı���
	String hot_picture = "";//�������ų���ͼƬ�ı���
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
	<!-- ��վͷ�� -->
	<%@ include file="general_header.jsp"%>
	<!-- //��վͷ�� -->
	<!-- �ֲ���漰���ų��� -->
	<div class="container B11-sl B11-sl-1">
		<div class="B11-spotlight B11-spotlight-1  row">
			<!-- ��ʾ�ֲ���� -->
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
										//ʵ�ֵ��ûõ�Ƭ����ֲ����

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
	<!-- //�ֲ���漰���ų���  -->
	<!-- �����ϼܼ����۳���չʾ -->
	<nav class="container B11-masstop  hidden-sm hidden-xs">
	<div class="custom">
		<div>
			<div class="ja-tabswrap default" style="width: 100%;">
				<div id="myTab" class="container">

					<h3 class="index_h3">
						<span class="index_title">NEW</span>
					</h3>
					<!-- //�����ϼ�ѡ� -->
					<div class="ja-tab-content ja-tab-content col-6 active"
						style="opacity: 1; width: 100%; visibility: visible;">
						<div class="ja-tab-subcontent">
							<div class="mijoshop">
								<div class="container_oc">
									<div class="row">
										<!-- ѭ����ʾ�����ϼܳ��� �����12��������Ϣ-->
										<%
											while (rs_new.next()) {//����һ��ѭ��
												new_ID = rs_new.getInt(1); //��ȡ�����ϼܳ����ID
												new_goodName = rs_new.getString(2); //��ȡ�����ϼܳ��������
												new_nowprice = rs_new.getFloat(3); //��ȡ�����ϼܳ���ļ۸�
												new_picture = rs_new.getString(4); //��ȡ�����ϼܳ����ͼƬ
												typeName = rs_new.getString(5); //��ȡ�����ϼܳ�������
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
															style="color: #0885B1">good's name��</span> <%=new_goodName%></a>
													</div>
													<p class="price">
														Price��<%=new_nowprice%>Yuan
													</p>
												</div>
											</div>
										</div>
										<%
											}
										%>
										<!-- //ѭ����ʾ�����ϼܳ�����12��������Ϣ -->
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- //�����ϼ�ѡ� -->
					<!-- ���۳���ѡ� -->
					<h3 class="index_h3"><span class="index_title">SALE</span></h3>
					<div class="ja-tab-subcontent">
						<div class="mijoshop">
							<div class="container_oc">
								<div class="row">
									<!-- ѭ����ʾ���۳��� �����12��������Ϣ-->
									<%
										while (rs_sale.next()) {//����һ��ѭ��
											sale_ID = rs_sale.getInt(1); //��ȡ���۳����ID
											s_goodname = rs_sale.getString(2); //��ȡ���۳��������
											s_price = rs_sale.getFloat(3); //��ȡ���۳����ԭ��
											s_nowprice = rs_sale.getFloat(4); //��ȡ���۳�����ּ�
											s_picture = rs_sale.getString(5); //��ȡ���۳����ͼƬ
											typeName = rs_sale.getString(6); //��ȡ���۳�������
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
														style="width: 95%"> <span style="color: #0885B1">good's name��</span><%=s_goodname%></a>
												</div>
												<div class="name" style="margin-top: 10px">
													<span style="color: #0885B1">Classification��</span><%=typeName%>
												</div>
												<span class="price"> current price��<%=s_nowprice%> Yuan
												</span><br> <span class="oldprice">original cost��<%=s_price%> Yuan
												</span>
											</div>
										</div>
									</div>
									<%
										}
									%>
									<!-- ѭ����ʾ���۳��� �����12��������Ϣ-->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- //���۳��� ѡ�-->
			</div>
		</div>
	</div>
	</nav>
	<!-- //�����ϼܼ����۳���չʾ -->
	<!-- ��Ȩ�� -->
	<%@ include file="general_footer.jsp"%>
	<!-- //��Ȩ�� -->
</body>
</html>