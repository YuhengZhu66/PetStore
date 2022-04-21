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
				temp = conn.executeUpdate_id(sql);// ���涩����������
				if (temp == 0) {//������صĶ�����Ϊ0����ʾ���Ϸ�
					flag = false;
				} else {
					orderID = temp;//�����ɵĶ����Ÿ�ֵ������ID����
				}
				String str = "";//������붩����ϸ��Ϣ��SQL���
				//���붩����ϸ������
				for (int i = 0; i < cart.size(); i++) {
					Goodelement mygoodelement = (Goodelement) cart.elementAt(i);//��ȡ���ﳵ�е�һ��ͼ��
					ID = mygoodelement.ID;//��ȡͼ��ID
					nowprice = mygoodelement.nowprice;//��ȡͼ��۸�
					number = mygoodelement.number;//��ȡͼ������
					sum = nowprice * number;//����ͼ����
					str = "insert into tb_order_Detail (orderID,goodID,price,number) values(" + orderID + ","
							+ ID + "," + nowprice + "," + number + ")";//���붩����ϸ��SQL���
					temp = conn.executeUpdate(str);//���涩����ϸ
					Totalsum = Totalsum + sum;//�ۼӺϼƽ��
					if (temp == 0) {//�������ֵΪ0����ʾ���Ϸ�
						flag = false;
					}
				}

				if (!flag) {//���������Ч
					out.println("<script language='javascript'>alert('The order is invalid');history.back();</script>");
				} else {
					session.removeAttribute("cart");//��չ��ﳵ
					out.println("<script language='javascript'>alert('Order generation, please remember your order number[" + orderID
							+ "]');window.location.href='index.jsp';</script>");//��ʾ���ɵĶ�����
				}
				conn.close();//�ر����ݿ�����
			}
		} catch (Exception e) {//�����쳣
			out.println(e.toString());//����쳣��Ϣ
		}
	} else {
		session.invalidate();//����Session
		out.println(
				"<script language='javascript'>alert('Please log in first before shopping!');window.location.href='index.jsp';</script>");
	}
%>
</body>
</html>