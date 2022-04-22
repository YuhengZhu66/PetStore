<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<header id="B11-header" class="wrap B11-header">
	<div class="container">
		<div class="row">
			<!-- //Logo -->
			<!-- Article the main navigation -->
			<nav id="B11-mainnav"
				class="col-xs-12 col-md-6 B11-mainnav navbar navbar-default">
				<div class="B11-navbar navbar-collapse collapse">
					<div class="B11-megamenu animate slide" data-duration="400"
						data-responsive="true">
						<ul class="nav navbar-nav level0">
							<li itemprop="name" data-id="435" data-level="1"><a
								id="index" itemprop="url" class="" href="index.jsp"
								data-target="#">
<%--								homepage --%>
								<img src="./images/type_1.png" style="width: 25px; height: 25px">
							</a></li>
							<li itemprop="name" data-id="510" data-level="1"><a
                                    id="a" itemprop="url" class=""
                                    href="goodsList.jsp?type=14" data-target="#">
<%--								a--%>
								<img src="./images/type_2.png" style="width: 25px; height: 25px">
							</a></li>

							<li itemprop="name" data-id="510" data-level="1"><a
								id="b" itemprop="url" class="" href="goodsList.jsp?type=15"
								data-target="#">
<%--									b--%>
								<img src="./images/type_3.png" style="width: 25px; height: 25px">
							</a></li>

							<li itemprop="name" data-id="510" data-level="1"><a
								id="c" itemprop="url" class="" href="goodsList.jsp?type=16"
								data-target="#">
<%--								c--%>
								<img src="./images/type_4.png" style="width: 35px; height: 25px">
							</a></li>
						</ul>
					</div>

				</div>
			</nav>
		</div>
	</div>
</header>
<script>
	// Get page parameters
	function GetString(name) {
		var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");//regular expression
		var r = window.location.search.substr(1).match(reg);//Gets the mouse click area
		if (r != null)
			return (r[2]);//Return area number
		return null;
	}
	var type = GetString('type');
	if (type === '14') {
		var a = document.getElementById('a');
		a.style.backgroundColor = "#8c0f14";

	}
	if (type === '15') {
		var b = document.getElementById('b');
		b.style.backgroundColor = "#8c0f14";

	}
	if (type === '16') {
		var c = document.getElementById('c');
		c.style.backgroundColor = "#8c0f14";

	}

	if (type == null) {//By default, there is no click for login
		var index = document.getElementById('index');
		index.style.backgroundColor = "#8c0f14";

	}
</script>