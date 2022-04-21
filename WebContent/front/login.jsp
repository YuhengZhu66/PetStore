<%@ page contentType="text/html; charset=GBK"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>Login-Pet Shop</title>
<link rel="stylesheet" href="css/B11-01.css" type="text/css">

    <!-- Le HTML5 shim and media query for IE8 support -->
    <!--[if lt IE 9]>
    <script type="text/javascript" src="js/html5.js"></script>
    <script type="text/javascript" src="js/respond.min.js"></script>
    <![endif]-->
</head>

<body>
	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">
			<!--主体内容-->
			<div id="B11-content" class="B11-content col-xs-12">
				<div class="login-wrap" style="margin-bottom: 60px; margin-top: 50px">
					<div style="max-width: 540px; margin: 0 auto;">
						<a href="index.jsp" title="Click back to home page"><img src="images/xaw_b.png"></a>
					</div>
					<div class="login">
						<div class="page-header" style="pause: 0px;"> <h1 class="login_h1">Member login</h1> </div>
						<!--会员登录表单-->
						<form action="login_check.jsp" method="post" class="form-horizontal">
							<fieldset>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">Account ：</label>
									</div>
									<div class="col-sm-8">
										<!--账户文本框-->
										<input type="text" name="username" id="username" value="" size="38"
											class="validate-username required" required="required" autofocus="">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">Password ：</label>
									</div>
									<div class="col-sm-8">
										<!--密码文本框-->
										<input type="password" name=PWD id="password" value=""
											class="validate-password required" size="38" maxlength="99"
											required="required" aria-required="true">
									</div>
								</div>
<div class="form-group">
    <div class="col-sm-offset-4 col-sm-8">
        <button type="submit" class="btn btn-primary login">Login</button>
    </div>
</div>
<div class="form-group"
    style="border-top: 1px solid #D9D9D9; margin: 20px;">
    <label
        style="float: right; color: #858585; margin-right: 40px; margin-top: 10px; font-size: 14px;">No account？<a
        href="register.jsp">Apply Now!</a></label>
</div>
</fieldset>
</form>
</div>
</div>
</div>
<!-- //主体内容 -->
</div>
</div>
<script language="javascript">
//刷新验证码
function myReload() {
document.getElementById("img_checkCode").src = document.getElementById("img_checkCode").src + "?nocache=" + new Date().getTime();
}
</script>
</body>
</html>