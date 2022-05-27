<%@ page contentType="text/html; charset=GBK"%>
<jsp:useBean id="chStr" scope="page" class="com.example.shop.tools.ChStr" />
<%
	String username = (String) session.getAttribute("username");

	if (username == null || username == "") {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="B11 B11-phone"></i> <span style="margin-right: 15px;">Telephone number£º666</span><a
						href="login.jsp">Login</a>&nbsp; £ü &nbsp;<a href="register.jsp">Register</a>
				</p>
			</div>
			<div class="toolbar-ct-2">
				<a href="orderList.jsp">My orders</a>&nbsp;&nbsp;  &nbsp;&nbsp;
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/LOGO.png">
					</div>

					<div class="search_box">
						<div class="top-nav-search">
							<form method="post" action="search_result.jsp">
								<input type="text" name="searchword" size="38"
									   style="border: 0px;" class="top-nav-search-input"
									   placeholder="Please enter the content" /> <input type="image"
																						src="images/search.png" class="search_box_img"
																						onFocus="this.blur()" />
							</form>
						</div>
					</div>

				</div>

				<div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3">


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;">
						<a href="cart_see.jsp" style="color: #E33737; font-size: 20px;"><i
							class="B11 B11-cart1"></i> My shopping cart</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	} else {
%>
<div id="toolbar" style="background-color: #F0F0F0; width: 100%;">
	<div class="container">
		<div class="row">
			<div class="toolbar-ct-1">
				<p>
					<i class="B11 B11-phone"></i> <span style="margin-right: 15px;">Telephone number£º666</span>Hello£¬<%=username%>
					&nbsp; &nbsp;<a href="modifyMember.jsp">modification</a>&nbsp;&nbsp;
					|&nbsp;&nbsp;<a href="${pageContext.request.contextPath}/user/logout.action">Logout</a>
				</p>
			</div>
			<div class="toolbar-ct-2">
				<a href="orderList.jsp">My orders</a>&nbsp;&nbsp;  &nbsp;&nbsp; <a
					href=""></a>
			</div>
		</div>
	</div>
	<div style="background-color: white; width: 100%">
		<div class="container">
			<div class="row">
				<div class="toolbar-ct col-xs-12 col-md-6  hidden-sm hidden-xs">
					<div class="toolbar-ct-1">
						<img src="images/LOGO.png">
					</div>
				</div>

				<div class="toolbar-ct toolbar-ct-right col-xs-12 col-md-3">


					<div class="toolbar-ct-2 "
						style="margin-top: 35px; border: 1px solid #EAEAEA; padding: 5px;">
						<a href="cart_see.jsp" style="color: #E33737; font-size: 20px;"><i
							class="B11 B11-cart1"></i> My shopping cart</a>


					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%
	}
%>