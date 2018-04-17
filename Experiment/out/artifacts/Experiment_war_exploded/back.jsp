<%@ page import="com.experiment.dao.BookDao" %>
<%@ page import="com.experiment.model.Books" %>
<%@ page import="java.util.List" %>
<%@ page import="com.experiment.model.User" %><%--
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
    List<Books> books=dao.showAllBooks();
    int begin=0;//每次从begin开始显示books中的元素
    String  index=request.getParameter("begin");
    if(index!=null||index!=""){
        begin=Integer.parseInt(index);
    }
    int count=1;//页数
    if(books!=null){
    int size=books.size();
    count=books.size()%7==0?(books.size()/7):books.size()/7+1;
%>
<!--<![endif]-->
<div class="navbar">
    <div class="navbar-inner">
        <ul class="nav pull-right">

            <li><a href="#" class="hidden-phone visible-tablet visible-desktop" role="button">管理员</a></li>
            <li id="fat-menu" class="dropdown">
                <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">
                    <i class="icon-user"></i> 亚峰
                    <i class="icon-caret-down"></i>
                </a>

                <ul class="dropdown-menu">
                    <li><a tabindex="-1" href="#">个人中心</a></li>
                    <li class="divider"></li>
                    <li><a tabindex="-1" class="visible-phone" href="#">Settings</a></li>
                    <li class="divider visible-phone"></li>
                    <li><a tabindex="-1" href="index.jsp">退出</a></li>
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
        <li><a href="back.jsp?begin=<%=0%>">图书列表</a> <span class="divider">/</span></li>
    </ul>

    <div class="container-fluid">
        <div class="row-fluid">
            <form method="post" action="/delete.do" id="form" name="form">
            <div class="btn-toolbar">
                <button class="btn btn-primary" onclick="document.form.action='add.jsp';document.form.submit();"><i class="icon-plus"></i>添加</button>
                <button class="btn">批量删除</button>
                <div class="btn-group">
                </div>
            </div>
            <div class="well">

                <table class="table">
                    <thead>
                    <tr>

                        <td>编号</td>
                        <td>书名</td>
                        <td>作者</td>
                        <td>价格</td>
                        <td>出版日期</td>
                        <td>删除</td>
                        <td>编辑</td>
                        <td></td>
                        <td style="width: 26px;"></td>
                    </tr>
                    </thead>
                    <%
                        int i=1;
                    for(int k=begin;k<books.size()&&i<7;k++){
                        Books b=books.get(k);
                    %>
                    <tbody>
                    <tr>
                        <td><%=i%></td>
                        <td>《<%=b.getBook_name()%>》</td>
                        <td><%=b.getBook_author_name()%></td>
                        <td><%=b.getBook_price()%></td>
                        <td><%= b.getBook_publish_date()%></td>
                        <td><input type="checkbox" name="box" value="<%=b.getId()%>"></td>
                        <td>
                            <a href="edit.jsp?book_id=<%=b.getId()%>"><i class="icon-pencil"></i></a>
                        </td>
                    </tr>
                    </tbody>
                    <%
                    i++;
                    }
                    %>
                </table>
            </form>
            </div>

            <div class="pagination">

                <ul>

                    <li><a href="back.jsp?begin=<%=(begin-7)<=0?0:(begin-7)%>">前一页</a></li>
                    <%
                    for(int j=0;j<count;j++){
                     %>
                    <li><a href="back.jsp?begin=<%=7*j%>"><%=(j+1)%></a></li>
                    <%}%>
                    <li><a href="back.jsp?begin=<%=(begin+7)>=size?0:(begin+7)%>">后一页</a></li>
                    <li><a href="#">总共<%=count%>页</a></li>
                    <li><a href="#">当前第<%=(begin-7)/7+2%>页</a></li>
                </ul>

            </div>
        <%
            }%>

            <div class="modal small hide fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h3 id="myModalLabel">Delete Confirmation</h3>
                </div>
                <div class="modal-body">
                    <p class="error-text"><i class="icon-warning-sign modal-icon"></i>Are you sure you want to delete the user?</p>
                </div>
                <div class="modal-footer">
                    <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
                    <button class="btn btn-danger" data-dismiss="modal">Delete</button>
                </div>
            </div>



            <div id="templatemo_footer" align="center" style="background-color: #B3B3B3;height: 40px;border-radius: 5px">
                Copyright © 2018 <a href="#"><strong>田亚峰</strong></a> |<a href="index.jsp" target="_parent">图书商城</a>
            </div> <!-- end of footer -->

        </div>
    </div>
</div>



<script src="/back/lib/bootstrap/js/bootstrap.js"></script>
<script type="text/javascript">
    $("[rel=tooltip]").tooltip();
    $(function() {
        $('.demo-cancel-click').click(function(){return false;});
    });
    function last() {
        var count=<%=count%>;
        count--;
    }
    function next() {

    }
</script>

</body>
</html>


