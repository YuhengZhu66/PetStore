<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>register-pet store</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">

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
	<!-- main -->
	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">
			<div id="B11-content" class="B11-content col-xs-12">
				<div class="login-wrap"
					style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="index.jsp" title="Click back to home page"><img
							src="images/LOGO.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;">
							<h1 class="login_h1">member registration</h1>
						</div>
						<!-- register -->
						<form id="member-registration" action="register_deal.jsp"
							onsubmit="return regis();" method="post" class="form-horizontal">

							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">
											account ：</label>
									</div>
									<div class="col-sm-8">
										<!-- Account text box -->
										<input type="text" name="username" id="username" value=""
											class="required" size="38" required
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											real name ：</label>
									</div>
									<div class="col-sm-8">

										<input type="text" name="truename" id="jform_username"
											value="" class="validate-username required" size="38"
											required="required" aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Password ：</label>
									</div>
									<div class="col-sm-8">

										<input type="password" name="pwd" id="pwd" value=""
											autocomplete="off" class="validate-password required"
											size="38" maxlength="99" required
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											confirm password ：</label>
									</div>
									<div class="col-sm-8">

										<input type="password" name="pwd2" id="pwd2" value=""
											autocomplete="off" class="validate-password required"
											size="38" maxlength="99" required
											aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											contact number ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">

										<input type="text" name="tel" class="validate-email " id="tel"
											value="" size="38" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											mailbox ：</label>
									</div>
									<div class="col-sm-8" style="clear: none;">

										<input type="email" name="email" class="validate-email"
											id="jform_email2" value="" size="38" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div style="float: right; padding-right: 216px;">
										pet store<a href="agreement.jsp" target="_blank" style="color: #0885B1;">《agreement》</a>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8">
										<button type="submit" class="btn btn-primary login">Agree to the agreement and register</button>
									</div>
								</div>
								<div class="form-group" style="margin: 20px;">
									<label
										style="float: right; color: #858585; margin-right: 80px; margin-top: 10px; font-size: 14px;">Existing account！<a
										href="login.jsp">Log In</a></label>
								</div>
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
<!-- Verify that the entered registration information is valid -->
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script>
	function regis() {
		/* ----------- Verify that the entered account is valid ------------------------- */
		if (/^[\u4e00-\u9fa5]+$/.test($('#username').val())) {
			alert("The account cannot enter Chinese characters！");
			return false;
		}
		/* ----------- tel --------------------- */
		if (isNaN($('#tel').val())) {
			alert("Contact number Please enter a number");
			return false;
		}
		/* ----------- pwd same--------------------- */
		var pwd = document.getElementById("pwd").value;
		var pwd2 = document.getElementById("pwd2").value;
		if (pwd !== pwd2) {
			alert('Passwords are inconsistent！');
			return false;
		}
		return true;
	}
</script>
</html>