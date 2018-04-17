<%--
  Created by IntelliJ IDEA.
  User: yafeng
  Date: 18-4-12
  Time: 下午11:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<!DOCTYPE html>
<html>
<head>
    <title>用户登录</title>
    <link rel="icon" href="/images/2.jpg" type="image/x-icon"/>
    <link rel="stylesheet" href="css/style.css">

    <!--<link href='//fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css'>
-->
    <!-- For-Mobile-Apps-and-Meta-Tags -->
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="Simple Login Form Widget Responsive, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //For-Mobile-Apps-and-Meta-Tags -->
<style>
</style>
</head>

<body>
<h1>图书商城</h1>
<%
        Cookie []cookies;
        Cookie cookie=null;
        int userId=0;
        int pwd=0;
        int remember=0;
        cookies=request.getCookies();
        if(cookies!=null){
            String password="";
            Long user_id=null;
            for(int i=0;i<cookies.length;i++){
                cookie=cookies[i];
                if(cookie.getName().equals("user_id")){
                    userId=1;
                }
                if (cookie.getName().equals("password")){
                    pwd=1;
                }
            }
            if(userId*pwd==1){
                response.sendRedirect("back.jsp?begin="+0);
            }
        }
%>
<div class="container w3">
    <h2>现在登录</h2>
    <font style="color: #942a25">${requestScope["message"]}</font>
    <form action="/login.do" method="post" name="myform">
        <div class="username">
            <span class="username" style="height:19px">帐号:</span>
            <input type="text" name="user_id" id="userId" class="name" placeholder="" required="" onchange="checkUserId()">
            <div class="clear"></div>
        </div>
        <div class="password-agileits">
            <span class="username"style="height:19px">密码:</span>
            <input type="password" name="password" class="password"placeholder="" required="">
            <div class="clear"></div>
        </div>
        <div class="rem-for-agile">
            <input type="checkbox"  id="save" name="save" class="remember" onchange="checkBok()">自动登录
            <input type="checkbox" id="remember" name="remember" class="remember">记住我
            <br>
            <a href="index.jsp">上一页</a><br>
        </div>
        <div class="login-w3">
            <input type="submit" class="login" value="Login">
        </div>
        <div class="clear"></div>
    </form>
</div>
<div class="footer-w3l">
    <p> @copyright 田亚峰</p>
</div>
<script>
 function checkBok() {
     var box=document.getElementById("save");
     if(box.checked){
         document.getElementById("save").value=1;
     }else {
         document.getElementById("save").value=0;
     }
 }
    function checkUserId() {
        var user_id=document.forms["myform"]["user_id"].value;
        //正则表达式,匹配全为数字
        var reg = /^[0-9]+$/;
        var isnum=reg.test(user_id);
        if(!isnum){
            alert("帐号必须位为数字,重新输入");
            return false;
        }
        return true;
    }
</script>
</body>
</html>
