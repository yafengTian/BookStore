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
    <link rel="icon" href="/images/2.jpg" type="image/x-incon">
    <meta content="IE=edge,chrome=1" http-equiv="X-UA-Compatible">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <link rel="stylesheet" type="text/css" href="/back/lib/bootstrap/css/bootstrap.css">

    <link rel="stylesheet" type="text/css" href="/back/stylesheets/theme.css">
    <link rel="stylesheet" href="/back/lib/font-awesome/css/font-awesome.css">


    <script src="/back/lib/jquery-1.7.2.min.js" type="text/javascript"></script>

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
<%
    BookDao dao=BookDao.getInstaace();
    String b_id=request.getParameter("book_id");
    int book_id=0;
    if(b_id!=null){
        book_id=Integer.parseInt(b_id);
    }
    List<Books> books=dao.searchBook(book_id);
    %>
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
        <a class="brand" href="back.jsp"><span class="second">后台管理</span></a>
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
        <li><a href="back.jsp?begin=<%=0%>">修改信息</a> <span class="divider">/</span></li>
    </ul>
    <div class="container-fluid">
        <%
        if(books!=null){
            Books b=books.get(0);
            %>

        <form id="form" name="form" method="post" action="/update.do?book_id=<%=b.getId()%>">
            <div class="btn-toolbar">
                <button class="btn btn-primary"><i class="icon-plus"></i>保存</button>
                <button class="btn" onclick="document.form.action='back.jsp?begin=<%=0%>';document.form.submit();">取消</button>
                <div class="btn-group">
                </div>
            </div>
            <table>

               <tr> <td>书名</td><td><input type="text"  name="book_name" value="<%=b.getBook_name()%>" style="width: 760px;height: 30px;border-radius: 5px"/></td></tr>
               <tr> <td>作者</td><td><input type="text"  name="book_author" value="<%=b.getBook_author_name()%>" style="width: 760px;height: 30px;border-radius: 5px"/></td></tr>
                <tr><td>价格</td><td><input type="text"  name="book_price" value="<%=b.getBook_price()%>" style="width: 760px;height: 30px;border-radius: 5px"/> </td></tr>
                <tr><td>出版日期</td><td><input type="date" name="book_publish_date" value="<%=b.getBook_publish_date()%>" style="width: 760px;height: 30px;border-radius:5px
"/></td></tr>
                <tr><td>图书介绍</td><td><textarea name="scraption" style="border-radius: 5px;width: 760px;height: 200px;"><%=b.getScraption()%></textarea></td></tr>
            </table>
        </form>
        <%}%>
        <div id="templatemo_footer" align="center" style="background-color: #B3B3B3;height: 40px;border-radius: 5px">
        Copyright © 2018 <a href="#"><strong>田亚峰</strong></a> |<a href="index.jsp" target="_parent">图书商城</a>
    </div> <!-- end of footer -->

    </div>

</div>



<script src="/back/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
</script>

</body>
</html>


