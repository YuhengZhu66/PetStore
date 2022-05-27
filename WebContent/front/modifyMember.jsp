<%@ page contentType="text/html; charset=GBK"%>
<%@ page import="java.sql.ResultSet"%>
<jsp:useBean id="conn" scope="page" class="com.example.shop.tools.ConnDB" />
<jsp:useBean id="chStr" scope="page" class="com.example.shop.tools.ChStr" />
<%
	String username = (String) session.getAttribute("username");
	if (username != null && username != "") {
		String sql = "select * from tb_member where username='" + username + "'";
		ResultSet rs = conn.executeQuery(sql);
		int id = -1;
		String truename = "";
		String PWD = "";
		String city = "";
		String address = "";
		String postcode = "";
		String cardNO = "";
		String cardType = "";
		String tel = "";
		String email = "";
		if (rs.next()) {
			id = rs.getInt(1);
			truename = rs.getString(3);
			System.out.println(truename);
			PWD = rs.getString(4);
			city = rs.getString(5);
			address = rs.getString(6);
			postcode = rs.getString(7);
			cardNO = rs.getString(8);
			cardType = rs.getString(9);
			tel = rs.getString(12);
			email = rs.getString(13);
		}
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=GBK">
<title>Registeration-Online Pet Shop</title>
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
	<jsp:include page="index_log-inCon.jsp" />
	<%@ include file="general_header.jsp"%>

	<div id="B11-mainbody" class="container B11-mainbody">
		<div class="row">
			<!-- MAIN CONTENT -->
			<div id="B11-content" class="B11-content col-xs-12">
				<div id="system-message-container" style="display: none;"></div>

				<div class="registration col-sm-6 col-sm-offset-3">

						<!-- member registration -->
					<form id="member-registration" action="${pageContext.request.contextPath}/user/modify.action"
						onsubmit="return regis();" method="post"
						class="form-horizontal">

							<fieldset>
								<legend style="color: #929292; font-size: 26px">Modifying User Information</legend>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="username-lbl" for="username" class="required">
											Account £º</label>
									</div>
									<div class="col-sm-8">
										<!-- Account text box -->
										<input type="text" name="username" id="username"
									value="<%=username%>" class="required" size="38"
									aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Real Name £º</label>
									</div>
									<div class="col-sm-8">

										<input type="text" name="truename" id="jform_username"
									value="<%=truename%>" class="validate-username required"
									size="38" aria-required="true"><span
											class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Original Password £º</label>
									</div>
									<div class="col-sm-8">

										<input type="password" name="pwd" id="pwd" value=""
									autocomplete="off" class="validate-password required" size="38"
									maxlength="99" required="required" aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>


								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											New Password £º</label>
									</div>
									<div class="col-sm-8">

										<input type="password" name="newPwd" id="newPwd" value=""
									autocomplete="off" class="validate-password required" size="38"
									maxlength="99" aria-required="true"><span class="star">&nbsp;*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Check Password £º</label>
									</div>
									<div class="col-sm-8">

										<input type="password" name="newPwd2" id="newPwd2"
									class="validate-password required" value="" size="38"
									aria-required="true"><span class="star">*</span>
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Phone Number £º</label>
									</div>
									<div class="col-sm-8" style="clear: none;">

										<input type="text" name="tel" class="validate-email " id="tel"
									value="<%=tel%>" size="38" autocomplete="email" aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-4 control-label">
										<label id="password-lbl" for="password" class="required">
											Email £º</label>
									</div>
									<div class="col-sm-8" style="clear: none;">

										<input type="email" name="email" class="validate-email"
									id="jform_email2" value="<%=email%>" size="38"
									aria-required="true">
									</div>
								</div>
								<div class="form-group">
									<div class="col-sm-offset-4 col-sm-8" style="margin-left: 150px;"><input name="ID" type="hidden" value="<%=id%>">
										<button type="submit" class="btn btn-primary pull-left" style="width:100px;">Submit</button>
							<button type="button" onclick="javascript:history.go(-1)"
								class="btn btn-primary pull-left" style="width:100px;">CANCEL</button>
									</div>
								</div>
							</fieldset>
						</form>
				</div>

			</div>
			<!-- //MAIN CONTENT -->

		</div>
	</div>

	<%@ include file="general_footer.jsp"%>

</body>
<script src="js/jquery.1.3.2.js" type="text/javascript"></script>
<script>
	function regis() {

		if (/^[\u4e00-\u9fa5]+$/.test($('#username').val())) {
			alert("The account cannot enter Chinese characters£¡");
			return false;
		}

		if (isNaN($('#tel').val())) {
			alert(" Please enter a number for Phone number");
			return false;
		}

		var pwd = document.getElementById("newPwd").value;
		var pwd2 = document.getElementById("newPwd2").value;
		if (pwd !== pwd2) {
			alert('The new password is inconsistent£¡');
			return false;
		}
		return true;
	}
</script>
</html>
<%
	conn.close();
	} else {
		out.println(
				"<script lanage='javascript'>alert('Please log in first and then modify your personal information!');window.location.href='index.jsp';</script>");
	}
%>