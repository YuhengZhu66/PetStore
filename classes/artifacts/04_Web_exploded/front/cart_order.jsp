<%@ page language="java" contentType="text/html; charset=GBK"
	pageEncoding="GBK"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="java.util.Vector"%>
<%@ page import="com.model.Goodelement"%>
<%@ page import="java.util.Objects" %>
<jsp:useBean id="chStr" scope="page" class="com.tools.ChStr" />
<jsp:useBean id="conn" scope="page" class="com.tools.ConnDB" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>Insert title here</title>
</head>
<body>
<%
	if (session.getAttribute("cart") == "") {//Determines whether the shopping cart object is empty
		out.println(
				"<script language='javascript'>alert('You haven't shopped yet!');window.location.href='index.jsp';</script>");
	}
	String Username = (String) session.getAttribute("username");
	if (!Objects.equals(Username, "")) {
		try {//abnormal
			ResultSet rs_user = conn.executeQuery("select * from tb_Member where username='" + Username + "'");
			if (!rs_user.next()) {//If the obtained account name does not exist in the member information sheet (indicates illegal member)
				session.invalidate();//destroy Session
				out.println(
						"<script language='javascript'>alert('Please log in first before shopping!');window.location.href='index.jsp';</script>");
				return;
			} else {//If you are a legitimate member, save the order
				String recevieName = chStr.chStr(request.getParameter("recevieName"));
				String address = chStr.chStr(request.getParameter("address"));
				String tel = request.getParameter("tel");
				String bz = chStr.chStr(request.getParameter("bz"));// Get input remarks
				int orderID = 0;//Define the variable that holds the order ID
				Vector cart = (Vector) session.getAttribute("cart");
				int number = 0;
				float nowprice = (float) 0.0;
				float sum = (float) 0;
				float Totalsum = (float) 0;
				boolean flag = true;//Flag whether the order is valid
				int temp = 0;//Save the variable that returns the automatically generated order number
				int ID = -1;
				//Insert order master table data
				float gnumber = cart.size();
				String sql = "insert into tb_Order(gnumber,username,recevieName,address,tel,bz) values("
						+ gnumber + ",'" + Username + "','" + recevieName + "','" + address + "','" + tel
						+ "','" + bz + "')";
				temp = conn.executeUpdate_id(sql);// 保存订单主表数据
				if (temp == 0) {//如果返回的订单号为0，表示不合法
					flag = false;
				} else {
					orderID = temp;//把生成的订单号赋值给订单ID变量
				}
				String str = "";//保存插入订单详细信息的SQL语句
				//插入订单明细表数据
				for (int i = 0; i < cart.size(); i++) {
					Goodelement mygoodelement = (Goodelement) cart.elementAt(i);//获取购物车中的一个图书
					ID = mygoodelement.ID;//获取图书ID
					nowprice = mygoodelement.nowprice;//获取图书价格
					number = mygoodelement.number;//获取图书数量
					sum = nowprice * number;//计算图书金额
					str = "insert into tb_order_Detail (orderID,goodID,price,number) values(" + orderID + ","
							+ ID + "," + nowprice + "," + number + ")";//插入订单明细的SQL语句
					temp = conn.executeUpdate(str);//保存订单明细
					Totalsum = Totalsum + sum;//累加合计金额
					if (temp == 0) {//如果返回值为0，表示不合法
						flag = false;
					}
				}

				if (!flag) {//如果订单无效
					out.println("<script language='javascript'>alert('The order is invalid');history.back();</script>");
				} else {
					session.removeAttribute("cart");//清空购物车
					out.println("<script language='javascript'>alert('Order generation, please remember your order number[" + orderID
							+ "]');window.location.href='index.jsp';</script>");//显示生成的订单号
				}
				conn.close();//关闭数据库连接
			}
		} catch (Exception e) {//处理异常
			out.println(e.toString());//输出异常信息
		}
	} else {
		session.invalidate();//销毁Session
		out.println(
				"<script language='javascript'>alert('Please log in first before shopping!');window.location.href='index.jsp';</script>");
	}
%>
</body>
</html>