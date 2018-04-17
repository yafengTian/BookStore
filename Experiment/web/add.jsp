<%@ page import="com.experiment.dao.BookDao" %>
<%@ page import="com.experiment.model.Books" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: yafeng
  Date: 18-4-12
  Time: 下午8:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>商城后台</title>
    <link rel="icon" href="/images/2.jpg" type="image/x-icon">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="/back/lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="/back/stylesheets/theme.css">
    <link rel="stylesheet" href="/back/lib/font-awesome/css/font-awesome.css">


    <!-- Demo page code -->

    <style type="text/css">
        html, body {
            height:100%;
        }
        #line-chart {
            height:300px;
            width:800px;
            margin: 0px auto;
            margin-top: 1em;
        }
        .brand { font-family: georgia, serif; }
        .brand .first {
            color: #ccc;
            font-style: italic;
        }
        .brand .second {
            color: #fff;
            font-weight: bold;
        }
        #footer {
            height:50px;
            width:100%;
            clear:both;
            margin-top:-50px;
            border-bottom:1px solid #e0e0e0;
            border-top:1px solid #e0e0e0;
        }
    </style>

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le fav and touch icons -->
    <link rel="shortcut icon" href="/back/assets/ico/favicon.ico">
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="/back/assets/ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="/back/assets/ico/apple-touch-icon-114-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="72x72" href="/back/assets/ico/apple-touch-icon-72-precomposed.png">
    <link rel="apple-touch-icon-precomposed" href="/back/assets/ico/apple-touch-icon-57-precomposed.png">
</head>

<!--[if lt IE 7 ]> <body class="ie ie6"> <![endif]-->
<!--[if IE 7 ]> <body class="ie ie7 "> <![endif]-->
<!--[if IE 8 ]> <body class="ie ie8 "> <![endif]-->
<!--[if IE 9 ]> <body class="ie ie9 "> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<body class="">

<!--<![endif]-->

<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">Settings</a></li>
            <li id="fat-menu" class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i> Jack Smith
                    <i class="icon-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="#">My Account</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                    <li class="divider visible-phone"></li>
                    <li><a tabindex="-1" href="sign-in.html">Logout</a></li>
                </ul>
            </li>

        </ul>
        <a class="brand" href="back.jsp?begin=<%=0%>"><span class="second">后台管理</span></a>
    </div>
</div>




<div class="sidebar-nav">
    <a href="back.jsp?begin=<%=0%>" class="nav-header" ><i class="icon-dashboard">图书列表</i></a>
    <a href="back.jsp?begin=<%=0%>" class="nav-header" ><i class="icon-dashboard">新书发布</i></a>

    <a href="back.jsp?begin=<%=0%>" class="nav-header" ><i class="icon-dashboard">购买历史</i></a>

    <a href="back.jsp?begin=<%=0%>" class="nav-header" ><i class="icon-dashboard">畅销图书</i></a>
    <a href="back.jsp?begin=<%=0%>" class="nav-header" ><i class="icon-dashboard">畅销图书</i></a>
</div>



<div class="content">
    <ul class="breadcrumb">
        <li class="active">图书管理/</li>
        <li><a href="back.jsp?begin=<%=0%>">添加图书</a> <span class="divider">/</span></li>
    </ul>

    <div class="container-fluid">


        <form method="post" action="/add.do" name="form" id="form">
            <table>
                <div class="btn-toolbar">
                    <button class="btn btn-primary" onsubmit="check()" onclick=" return check()"><i class="icon-plus"></i>添加</button>
                    <button class="btn" onclick="document.form.action='back.jsp?begin=<%=0%>';document.form.submit();">取消</button>
                    <div class="btn-group">
                    </div>
                </div>
                <tr> <td>书名</td><td><input type="text" id="name" name="book_name"  style="width: 760px;height: 30px;border-radius: 5px"/></td></tr>
                <tr> <td>作者</td><td><input type="text" id="author" name="book_author"  style="width: 760px;height: 30px;border-radius: 5px"/></td></tr>
                <tr><td>价格</td><td><input type="text"  id="price" name="book_price" style="width: 760px;height: 30px;border-radius: 5px"/> </td></tr>
                <tr><td>出版日期</td><td><input type="date" id="publish_date" name="book_publish_date"  style="width: 760px;height: 30px;border-radius:5px
"/></td></tr>
                <tr><td>图书介绍</td><td><textarea name="scraption" id="scr" style="border-radius: 5px;width: 760px;height: 200px;"></textarea></td></tr>
            </table>
        </form>
        <div id="templatemo_footer" align="center" style="background-color: #B3B3B3;height: 40px;border-radius: 5px">
            Copyright © 2018 <a href="#"><strong>田亚峰</strong></a> |<a href="index.jsp" target="_parent">图书商城</a>
        </div> <!-- end of footer -->

    </div>

</div>



<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
    function check() {
        var regx=/^[0-9]+$/
        var book_price=document.forms["form"]["price"].value;
        if(document.forms["form"]["name"].value==""){
            alert("书名不能为空");
            document.forms["form"]["name"].focus();
            return false;
        }
        if(document.forms["form"]["author"].value==""){
            alert("作者名不能为空!");
            document.forms["form"]["author"].focus();
            return false;
        }
        if(document.forms["form"]["publish_date"].value==''){
            alert("出版日期不能为空!");
            document.forms["form"]["publish_date"].focus();
            return false;
        }
        if(document.forms["form"]["price"].value==''){
            alert("价格不能为空!");
            document.forms["form"]["price"].focus();
            return false;
        }
        if(!regx.test(book_price)){
            alert("图书价格输入有误!必须为数字");
            return false;
        }if(document.forms["form"]["scr"].value==''){
            alert("图书介绍不能为空!");
            document.forms["form"]["scr"].focus();
            return false;
        }
        return true;
    }
</script>
</body>
</html>


