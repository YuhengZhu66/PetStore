package com.example.shop.controller;

import com.example.shop.dao.SubtypeDaoImpl;
import com.example.shop.model.SubType;
import com.example.shop.tools.ChStr;
import com.example.shop.tools.ConnDB;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@Controller
@RequestMapping("/subType")
public class SubTypeController {

    @RequestMapping("/add.action")
    public void add(HttpServletResponse response, SubType subType) throws SQLException, IOException {
        ChStr chStr = new ChStr();
        ConnDB conn = new ConnDB();
        SubtypeDaoImpl subtypeDao = new SubtypeDaoImpl();
        String typename=chStr.chStr(subType.gettypename());
        ResultSet rs=conn.executeQuery("select * from tb_subType where typename='"+typename+"'");
        if (rs.next()){
            response.getWriter().println("<script language='javascript'>alert('The subcategory has been added. Please add a new subcategory£¡');window.location.href='../sub_add.jsp';</script>");
        }else{
            int ret=0;
            ret=subtypeDao.insert(subType);
            if (ret!=0){
                response.getWriter().println("<script language='javascript'>alert('The subcategory information was added successfully£¡');window.location.href='../subType.jsp';</script>");
            }else{
                response.getWriter().println("<script language='javascript'>alert('Failed to add the subcategory information£¡');window.location.href='../sub_add.jsp';</script>");
            }
        }
    }

    @RequestMapping("/del.action")
    public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ConnDB conn = new ConnDB();
        String ID[]=request.getParameterValues("delid");
        String subTypeID="";
        if (ID.length>0){
            for(int i=0;i<ID.length;i++){
                subTypeID=subTypeID+ID[i]+",";
            }
            subTypeID=subTypeID.substring(0,subTypeID.length()-1);
            int ret=-1;
            String sql="Delete From tb_subType Where ID in("+subTypeID+")";
            ret=conn.executeUpdate(sql);
            if(ret==0){
                response.getWriter().println("<script lanuage='javascript'>alert('Failed to delete the subcategory!');window.location.href='../subType.jsp';</script>");
            }else{
                response.getWriter().println("<script lanuage='javascript'>alert('The subcategory information was deleted successfully!');window.location.href='../subType.jsp';</script>");
            }
        }else{
            response.getWriter().println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='../subType.jsp';</script>");
        }
    }

}
