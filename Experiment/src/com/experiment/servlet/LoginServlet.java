package com.experiment.servlet;

import com.experiment.dao.UserDao;
import com.experiment.model.User;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 *Experiment
 *@author yafeng
 *2018-4-12
 *下午11:02
 */
@javax.servlet.annotation.WebServlet(name = "LoginServlet")
public class LoginServlet extends javax.servlet.http.HttpServlet {
    UserDao dao = UserDao.getInstance();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

                String userId = request.getParameter("user_id");
                String password = request.getParameter("password");
                String save=request.getParameter("save");
                String remember=request.getParameter("remember");
                Cookie cookie;
                long uId=0;
                long user_id=0;
                String  pwd=null;
                if(userId!=null){
                    uId=Long.parseLong(userId);
                }
                //选中自动登录
                   if("1".equals(save)){
                        User user= dao.userLogin(uId, password);
                        if(user!=null){
                            Cookie user_Id=new Cookie("user_id",String.valueOf(uId));
                            Cookie pass=new Cookie("password",password);
                            //登录成功,设置cookie有效时间为5分钟
                            user_Id.setMaxAge(10);
                            pass.setMaxAge(10);
                            response.addCookie(user_Id);
                            response.addCookie(pass);
                            response.sendRedirect("back.jsp?begin="+0);
                        } else {
                            Cookie user_Id=new Cookie("user_id",String.valueOf(uId));
                            Cookie pass=new Cookie("password",password);
                            System.out.println(5);
                            //登录失败,设置有效时间为5秒
                            user_Id.setMaxAge(0);
                            pass.setMaxAge(0);
                            response.addCookie(user_Id);
                            response.addCookie(pass);
                            request.getSession().setAttribute("user",user);
                            request.setAttribute("message","密码或帐号错误");
                            request.getRequestDispatcher("login.jsp").forward(request,response);
                            response.sendRedirect("login.jsp");
                        }
                    }
                    //不自动登录
                    else{
                       System.out.println(6);
                       User user= dao.userLogin(uId, password);
                        if(user!=null){
                            System.out.println(7);
                            request.getSession().setAttribute("user",user);
                            response.sendRedirect("back.jsp?begin="+0);
                        }else{
                            request.setAttribute("message","密码或帐号错误");
                            request.getRequestDispatcher("login.jsp").forward(request,response);
                        }
                    }
    }
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException ,IOException{
     doPost(request,response);
    }
}
