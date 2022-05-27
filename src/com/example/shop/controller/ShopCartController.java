package com.example.shop.controller;

import com.example.shop.model.Goodelement;
import com.example.shop.tools.ChStr;
import com.example.shop.tools.ConnDB;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Objects;
import java.util.Vector;

@RequestMapping("/shopcart")
@Controller
public class ShopCartController {

    @RequestMapping("/add.action")
    public void add(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        String username=(String)session.getAttribute("username");
        String num = (String) request.getParameter("num");
        ConnDB conn = new ConnDB();
        //If you have not logged in, the login page is displayed
        if (username == null || username == "") {
            response.sendRedirect("../front/login.jsp");//Redirect the page to the member login page
            return;
        }

        int ID = Integer.parseInt(request.getParameter("goodID"));
        String sql = "select * from tb_good where ID=" + ID;//Define the SQL statement to query the product information according to the ID
        ResultSet rs = conn.executeQuery(sql);//Query by ID
        float nowprice = 0;//Defines the variable that holds the commodity price
        try {
            if (rs.next()) {
                nowprice = rs.getFloat("nowprice");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        Goodelement myelement = new Goodelement();//Create the object mygoodelement of the model class that holds the product information in the shopping cart
        myelement.ID = ID;//Save ID to mygoodelement object
        myelement.nowprice = nowprice;
        myelement.number = Integer.parseInt(num);
        boolean Flag = true;//Record whether the goods to be added already exist in the shopping cart
        Vector cart = (Vector) session.getAttribute("cart");//Get shopping cart object
        if (cart == null) {
            cart = new Vector();
        } else {
            //Determine whether the goods already exist in the shopping cart
            for (int i = 0; i < cart.size(); i++) {
                Goodelement Item = (Goodelement) cart.elementAt(i);
                if (Item.ID == myelement.ID) {
                    Item.number = Item.number + myelement.number;
                    cart.setElementAt(Item, i);
                    Flag = false;//Set the Flag variable to false to indicate that the good exists in the shopping cart
                }
            }
        }
        if (Flag)//If the good does not exist in the shopping cart
            cart.addElement(myelement);//Store the goods to be purchased in the shopping cart
        session.setAttribute("cart", cart);//Add the shopping cart object to the Session
        conn.close();
        response.sendRedirect("../front/cart_see.jsp");
    }

    @RequestMapping("/clear.action")
    public void clear(HttpSession session, HttpServletResponse response) throws IOException {
        session.removeAttribute("cart");
        response.sendRedirect("../front/cart_null.jsp");//Go to shopping cart for empty pages
    }

    @RequestMapping("/order.action")
    public void order(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        ConnDB conn = new ConnDB();
        if (session.getAttribute("cart") == "") {//Determines whether the shopping cart object is empty
            response.getWriter().println(
                    "<script language='javascript'>alert('You haven't shopped yet!');window.location.href='../index.jsp';</script>");
        }
        ChStr chStr = new ChStr();
        String Username = (String) session.getAttribute("username");
        if (!Objects.equals(Username, "")) {
            try {//abnormal
                ResultSet rs_user = conn.executeQuery("select * from tb_Member where username='" + Username + "'");
                if (!rs_user.next()) {//If the obtained account name does not exist in the member information sheet (indicates illegal member)
                    session.invalidate();//destroy Session
                    response.getWriter().println(
                            "<script language='javascript'>alert('Please log in first before shopping!');window.location.href='../index.jsp';</script>");
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
                    temp = conn.executeUpdate_id(sql);// Save the order master table data
                    if (temp == 0) {
                        flag = false;
                    } else {
                        orderID = temp;//Assign the generated order number to the order ID variable
                    }
                    String str = "";//Save the SQL statement to insert the order details
                    //Insert order list data
                    for (int i = 0; i < cart.size(); i++) {
                        Goodelement mygoodelement = (Goodelement) cart.elementAt(i);//Get a pet in the shopping cart
                        ID = mygoodelement.ID;
                        nowprice = mygoodelement.nowprice;
                        number = mygoodelement.number;
                        sum = nowprice * number;
                        str = "insert into tb_order_Detail (orderID,goodID,price,number) values(" + orderID + ","
                                + ID + "," + nowprice + "," + number + ")";//SQL statement to insert order details
                        temp = conn.executeUpdate(str);//Save order details
                        Totalsum = Totalsum + sum;
                        if (temp == 0) {
                            flag = false;
                        }
                    }

                    if (!flag) {//The order is invalid
                        response.getWriter().println("<script language='javascript'>alert('The order is invalid');history.back();</script>");
                    } else {
                        session.removeAttribute("cart");//Empty Cart
                        response.getWriter().println("<script language='javascript'>alert('Order generation, please remember your order number[" + orderID
                                + "]');window.location.href='../index.jsp';</script>");
                    }
                    conn.close();
                }
            } catch (Exception e) {
                response.getWriter().println(e.toString());
            }
        } else {
            session.invalidate();
            response.getWriter().println(
                    "<script language='javascript'>alert('Please log in first before shopping!');window.location.href='../index.jsp';</script>");
        }
    }

}
