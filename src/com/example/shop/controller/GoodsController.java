package com.example.shop.controller;

import com.example.shop.dao.GoodDaoImpl;
import com.example.shop.model.Goods;
import com.example.shop.tools.ChStr;
import com.example.shop.tools.ConnDB;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@RequestMapping("/goods")
@Controller
public class GoodsController {

    @RequestMapping("/add.action")
    public void add(HttpServletResponse response,
                    Goods good) throws IOException, SQLException {
        ChStr chStr = new ChStr();
        ConnDB conn = new ConnDB();
        GoodDaoImpl goodDao = new GoodDaoImpl();
        String goodName=chStr.chStr(good.getGoodName());
        ResultSet rs=conn.executeQuery("select * from tb_good where goodname='"+goodName+"'");
        if (rs.next()){
            response.getWriter().println("<script language='javascript'>alert('The product information has been added!');window.location.href='../goods_add.jsp';</script>");
        }else{
            int ret=0;
            ret=goodDao.insert(good);
            if (ret!=0){
                response.getWriter().println("<script language='javascript'>alert('The good information is added successfully£¡');window.location.href='../index.jsp';</script>");
            }else{
                response.getWriter().println("<script language='javascript'>alert('Failed to add the good information£¡');//window.location.href='../goods_add.jsp';</script>");
            }
        }
    }

    @RequestMapping("/del.action")
    public void del(Goods good, HttpServletResponse response) throws IOException, SQLException {
        ConnDB conn = new ConnDB();
        Integer id=good.getID();
        GoodDaoImpl dao = new GoodDaoImpl();
        ResultSet rs=conn.executeQuery("select * from tb_good where ID="+id);
        if (!rs.next()){
            response.getWriter().println("<script language='javascript'>alert('Your operation is wrong£¡');window.location.href='../index.jsp';</script>");
        }else{
            int ret=0;
            ret=dao.delete(good);
            if (ret!=0){
                response.getWriter().println("<script language='javascript'>alert('Description The good information is deleted successfully£¡');window.location.href='../index.jsp';</script>");
            }else{
                response.getWriter().println("<script language='javascript'>alert('The good information cannot be deleted£¡');window.location.href='../index.jsp';</script>");
            }
        }
    }

    @RequestMapping("/modify.action")
    public void modify(Goods good, HttpServletResponse response) throws SQLException, IOException {
        ConnDB conn = new ConnDB();
        Integer id=good.getID();
        GoodDaoImpl dao = new GoodDaoImpl();
        ResultSet rs=conn.executeQuery("select * from tb_good where ID="+id);
        if (!rs.next()){
            response.getWriter().println("<script language='javascript'>alert('Your operation is wrong£¡');window.location.href='../index.jsp';</script>");
        }else{
            int ret=0;
            ret=dao.update(good);
            if (ret!=0){
                response.getWriter().println("<script language='javascript'>alert('The product information is modified successfully£¡');window.location.href='../index.jsp';</script>");
            }else{
                response.getWriter().println("<script language='javascript'>alert('Failed to modify the product information£¡');window.location.href='../index.jsp';</script>");
            }
        }
    }

}
