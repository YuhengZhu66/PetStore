package com.example.shop.controller;

import com.example.shop.tools.ChStr;
import com.example.shop.tools.ConnDB;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @RequestMapping("/login.action")
    public void login(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        ConnDB conn = new ConnDB();
        ChStr chStr = new ChStr();
        String manager=chStr.chStr(request.getParameter("manager"));
        try{
            ResultSet rs=conn.executeQuery("select * from tb_manager where manager='"+manager+"'");
            if(rs.next()){
                String PWD=request.getParameter("PWD");
                if(PWD.equals(rs.getString("PWD"))){
                    session.setAttribute("manager",manager);
                    response.sendRedirect("../manage/index.jsp");
                }else{
                    response.getWriter().println("<script language='javascript'>alert('You have entered an incorrect account or password!');window.location.href='../manage/index.jsp';</script>");
                }
            }else{
                response.getWriter().println("<script language='javascript'>alert('You have entered an incorrect account or password!');window.location.href='../manage/index.jsp';</script>");
            }
        }catch(Exception e){
            response.getWriter().println("<script language='javascript'>alert('Your operation is wrong!');window.location.href='../manage/index.jsp';</script>");
        }
    }

    @RequestMapping("/logout.action")
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("../manage/index.jsp");
    }


}
