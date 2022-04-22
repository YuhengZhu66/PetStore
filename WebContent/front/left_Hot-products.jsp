<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<%
	int hot_ID = 0;
	String hot_goodName = "";
	float hot_nowprice = 0;
	String hot_picture = "";
	String sql="";
	if(request.getParameter("type")!=null && request.getParameter("type")!=""){
		int type=Integer.parseInt(request.getParameter("type"));
		sql="select top 7 t1.ID,t1.GoodName,t1.nowprice,t1.picture from tb_good t1,tb_subType t2 where t1.typeID=t2.ID and t2.superType="
				+ type + " order by t1.hit desc,t1.ID asc";
	}else if(request.getParameter("typeSystem")!=null && request.getParameter("typeSystem")!=""){
		int typeSystem = Integer.parseInt(request.getParameter("typeSystem"));
		sql="select top 7 ID,GoodName,nowprice,picture from tb_good where typeID=" + typeSystem
				+ " order by hit desc,ID asc";
	}else{
		sql="select top 7 ID,GoodName,nowprice,picture from tb_good order by hit desc";
	}
%>
<body background="images/background.png"></body>
<div
	class="B11-sidebar B11-sidebar-left col-xs-12 col-sm-4 col-sm-pull-8 col-md-3 col-md-pull-9  hidden-sm hidden-xs">

	<div class="B11-module module " id="Mod157">
		<div class="module-inner">
			<h3 class="module-title "></h3>
			<p style="text-align:center;font-family:Tahoma;color:red;font-size:30px;background-color: grey">Hot Product <img src="images/hot.jpg"><img src="images/hot.jpg"></p>
			<div class="module-ct">
				<div class="b11shop">
					<div class="container_oc">
						<div class="box_oc">
							<div>
								<div class="box-product product-grid">

									<%
										ResultSet rs_hot = conn
												.executeQuery(sql);

										int s2 = 0;
										while (rs_hot.next()) {
											hot_ID = rs_hot.getInt(1);
											hot_goodName = rs_hot.getString(2);
											hot_nowprice = rs_hot.getFloat(3);
											hot_picture = rs_hot.getString(4);
									%>
									<div>
										<div class="image">
											<a href="goodsDetail.jsp?ID=<%=hot_ID%>"><img
												src="../images/goods/<%=hot_picture%>" width="80px">
											</a>
										</div>
										<div class="name">
											<a href="goodsDetail.jsp?ID=<%=hot_ID%>"> <%=hot_goodName%>
											</a>
										</div>
										<div class="rating">
											<span class="B11 B11-stack"><i
												class="B11 B11-star B11-stack-2x"></i><i
												class="B11 B11-star-o B11-stack-2x"></i></span> <span
												class="B11 B11-stack"><i class="B11 B11-star B11-stack-2x"></i><i
												class="B11 B11-star-o B11-stack-2x"></i></span> <span
												class="B11 B11-stack"><i class="B11 B11-star B11-stack-2x"></i><i
												class="B11 B11-star-o B11-stack-2x"></i></span> <span
												class="B11 B11-stack"><i class="B11 B11-star B11-stack-2x"></i><i
												class="B11 B11-star-o B11-stack-2x"></i></span> <span
												class="B11 B11-stack"><i class="B11 B11-star B11-stack-2x"></i><i
												class="B11 B11-star-o B11-stack-2x"></i></span>
										</div>
										<div class="price">
											<%=hot_nowprice%>
											Yuan
										</div>

									</div>
									<%
										s2++;
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
</div>