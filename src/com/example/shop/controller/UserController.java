package com.example.shop.controller;

import com.example.shop.dao.MemberDaoImpl;
import com.example.shop.model.Member;
import com.example.shop.tools.ConnDB;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/login.action")
    public void login(HttpServletRequest request, HttpSession session, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        ConnDB conn = new ConnDB();
        if(true){
            try {
                ResultSet rs = conn.executeQuery("select * from tb_Member where username='"
                        + username + "'");
                if (rs.next()) {//If we find the corresponding account number
                    String PWD = request.getParameter("PWD");
                    if (PWD.equals(rs.getString("password"))) {
                        //Save the current account to Session for login
                        session.setAttribute("username", username);
                        response.sendRedirect("../index.jsp");
                    } else {
                        response.getWriter().println(
                                "<script language='javascript'>alert('The user name or password you entered is wrong!');"
                                        +"window.location.href='../front/login.jsp';</script>");
                    }
                } else {
                    response.getWriter().println(
                            "<script language='javascript'>alert('You entered the wrong username or password, or your account"+
                                    "has been frozen!');window.location.href='../front/login.jsp';</script>");
                }
            } catch (Exception e) {
                response.getWriter().println(
                        "<script language='javascript'>alert('Your operation is wrong!');"
                                +"window.location.href='../front/login.jsp';</script>");
            }
            conn.close();
        }
    }


    @RequestMapping("/register.action")
    public void register(HttpServletRequest request, HttpSession session, HttpServletResponse response,
                          Member member) throws IOException, SQLException {
        ConnDB conn = new ConnDB();
        request.setCharacterEncoding("GBK");//Set the request encoding to GBK
        String username = member.getUsername();
        MemberDaoImpl memberDao = new MemberDaoImpl();
        ResultSet rs = conn.executeQuery("select * from tb_Member where username='" + username + "'");
        if (rs.next()) {//If there is data in the result set
            response.getWriter().println("<script language='javascript'>alert('The account already exists. Please register again£¡');"
                    + "window.location.href='../front/register.jsp';</script>");
        } else {
            int ret = 0;//Records the variable that updates the number of records
            ret = memberDao.insert(member);//Save the membership information to the database
            if (ret != 0) {
                session.setAttribute("username", username);//Save the member account to Session
                response.getWriter().println("<script language='javascript'>alert('Member registration successful£¡');"
                        + "window.location.href='../index.jsp';</script>");
            } else {
                response.getWriter().println("<script language='javascript'>alert('Member registration failed£¡');"
                        + "window.location.href='../front/register.jsp';</script>");
            }
        }
    }

    @RequestMapping("/logout.action")
    public void logout(HttpSession session, HttpServletResponse response) throws IOException {
        session.invalidate();
        response.sendRedirect("../index.jsp");
    }

    @RequestMapping("/modify.action")
    public void modify(HttpServletRequest request, HttpServletResponse response, HttpSession session,
                       Member member) throws IOException, SQLException {
        MemberDaoImpl memberDao = new MemberDaoImpl();
        ConnDB connDB = new ConnDB();
        request.setCharacterEncoding("GBK");
        Integer id = member.getID();
        String pwd = member.getPwd();
        ResultSet rs = connDB.executeQuery("select * from tb_Member where ID='" + id+ "'");
        String pwdSql="";
        while (rs.next()) {
            pwdSql = rs.getString("passWord");
        }
        if (!pwd.equals(pwdSql)) {
            response.getWriter().println("<script language='javascript'>alert('The old password is incorrect£¡');window.location.href='modifyMember.jsp';</script>");
            return;
        }

        int ret = 0;
        ret = memberDao.update(member);
        if (ret != 0) {
            session.setAttribute("username",member.getUsername());
            response.getWriter().println("<script language='javascript'>alert('Member information modified successfully£¡');window.location.href='../index.jsp';</script>");
        } else {
            response.getWriter().println("<script language='javascript'>alert('Failed to modify member information£¡');window.location.href='../modifyMember.jsp';</script>");
        }
    }


}
