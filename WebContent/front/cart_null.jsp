<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>My shopping cart-Online Pet Shop</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">

    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<jsp:include page="index_log-inCon.jsp" />
	<%@ include file="general_header.jsp"%>
	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">

			<!-- MAIN CONTENT -->
			<div id="B11-content" class="B11-content col-xs-12">


				<div id="B11shop" class="B11shop common-home">
					<div class="container_oc">
						<div class="container_oc">
							<div class="breadcrumb"></div>
						</div>
						<div class="row">
							<div id="content_oc" class="col-sm-12" style="min-height:300px;">
								<h1>My shopping cart</h1>
								<div class="table-responsive cart-info" style="margin-bottom:50px;">Your shopping cart is empty！</div>
								<div class="buttons">
									<div class="pull-left">
										<a href="index.jsp" class="btn btn-primary btn-default">To continue shopping</a>
									</div>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>
	<%@ include file="general_footer.jsp"%>
</body>
</html>