package com.example.shop.controller;

import com.example.shop.dao.SuperTypeDaoImpl;
import com.example.shop.model.SuperType;
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
@RequestMapping("/superType")
public class SuperTypeController {

    @RequestMapping("/add.action")
    public void add(HttpServletResponse response, SuperType superType) throws SQLException, IOException {
        ChStr chStr = new ChStr();
        ConnDB conn = new ConnDB();
        String typename=chStr.chStr(superType.gettypename());
        ResultSet rs=conn.executeQuery("select * from tb_superType where typename='"+typename+"'");
        if (rs.next()){
            response.getWriter().println("<script language='javascript'>alert('The super category information has been added. Please add new super category information£¡');window.location.href='../super_add.jsp';</script>");
        }else{
            int ret=0;
            SuperTypeDaoImpl ins_SuperType=new SuperTypeDaoImpl();
            ret=ins_SuperType.insert(superType);
            if (ret!=0){
                response.getWriter().println("<script language='javascript'>alert('The super category information was added successfully£¡');window.location.href='../superType.jsp';</script>");
            }else{
                response.getWriter().println("<script language='javascript'>alert('Failed to add super category information£¡');window.location.href='../super_add.jsp';</script>");
            }
        }
    }

    @RequestMapping("/del.action")
    public void del(HttpServletRequest request, HttpServletResponse response) throws IOException {
        ConnDB conn = new ConnDB();
        String ID[]=request.getParameterValues("delid");
        String superTypeID="";
        if (ID.length>0){
            for(int i=0;i<ID.length;i++){
                superTypeID=superTypeID+ID[i]+",";
            }
            superTypeID=superTypeID.substring(0,superTypeID.length()-1);
            int ret=-1;
            String sql="Delete From tb_superType Where ID in("+superTypeID+")";
            ret=conn.executeUpdate(sql);
            if(ret==0){
                response.getWriter().println("<script lanuage='javascript'>alert('This category already contains sub-category information. Delete the sub-category information first and then delete it!');window.location.href='../superType.jsp';</script>");
            }else{
                response.getWriter().println("<script lanuage='javascript'>alert('Deleting the super category succeeded. !');window.location.href='../superType.jsp';</script>");
            }
        }else{
            response.getWriter().println("<script lanuage='javascript'>alert('Your operation is wrong!');window.location.href='../superType.jsp';</script>");
        }
    }

}
