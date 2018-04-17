<%@ page import="com.experiment.model.Books" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书商城</title>
    <link rel="icon" href="/images/2.jpg" type="image/x-incon">
    <meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
    <meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
    <link href="/css/templatemo_style.css" rel="stylesheet" type="text/css" />
    <link href="/css/fenye.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" type="text/css" href="/back/stylesheets/theme.css">
    <link rel="stylesheet" href="/back/lib/font-awesome/css/font-awesome.css">
    <style>
        .sty {
            margin: 0px;
            padding: 0px;
            float: right;
            width: 50px;
            height: 20px;
        }
    </style>
</head>
<body>
<%
    List<Books> books= (List<Books>) request.getSession().getAttribute("books");
    int begin=0;//每次从begin开始显示books中的元素
    String  index=request.getParameter("begin");
    if(index!=null||index!=""){
        begin=Integer.parseInt(index);
    }
    int count=1;//页数
    if(books!=null){
        count=books.size()/2+1;
%>
<!--  网站模板 from www.cssmoban.com -->
<div id="templatemo_container">
    <div id="templatemo_menu">
        <ul>
            <li><a href="index.jsp" class="current">首页</a></li>
            <li><a href="index.jsp">优惠活动</a></li>
            <li><a href="index.jsp">联系我们</a></li>

        </ul>
    </div> <!-- end of menu -->

    <div id="templatemo_header">
        <div id="templatemo_special_offers">
            <p>
                <span>最高优惠100元</span>
            </p>
            <a href="#" style="margin-left: 50px;">Read more...</a>
        </div>


        <div id="templatemo_new_books">
            <ul>
                <li>Spring  in action</li>
                <li>Java入门</li>
                <li>Python 21天从入门到精通</li>
            </ul>
            <a href="#" style="margin-left: 50px;">Read more...</a>
        </div>
    </div> <!-- end of header -->

    <div id="templatemo_content">

        <div id="templatemo_content_left">
            <div class="templatemo_content_left_section">
                <h1>Categories</h1>
                <ul>
                    <li>Spring in action</li>
                    <li>Java入门</li>
                    <li>Python2从入门到精通</li>
                </ul>
            </div>
            <div class="templatemo_content_left_section">
                <h1>Bestsellers</h1>
                <ul>
                    <li>Spring in action</li>
                    <li>Java入门</li>
                    <li>Python21天从入门到精通</li>
                </ul>
            </div>
            <div class="templatemo_content_left_section">
                <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
                <a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" vspace="8" border="0" /></a>
            </div>
        </div> <!-- end of content left -->

        <%
            int i=1;
        for(int k=begin;k<books.size()&&i<3;k++){
        Books book=books.get(k);
        %>
        <div id="templatemo_content_right">

            <h1>书名:<%=book.getBook_name()%></h1>
            <div class="image_panel"><img src="images/templatemo_image_02.jpg" alt="CSS Template" width="100" height="150" /></div>
            <h2>Read the lessons - Watch the videos - Do the exercises</h2>
            <ul>
                <li><span>作者:<%=book.getBook_author_name()%></span></li>
                <li><span>时间:<%=book.getBook_publish_date()%></span></li>
                <li><span>价格:<%=book.getBook_price()%></span></li>
                <li>ISBN 10: 0-496-91612-0 | ISBN 13: 9780492518154</li>
            </ul>

            <p><%=book.getScraption()%></p>

            <div class="cleaner_with_height">&nbsp;</div>



        </div> <!-- end of content right -->

        <div class="cleaner_with_height">&nbsp;</div>
        <%
                    i++;
        }

        }
        %>

        <div style="width: 500px;height: 50px" align="center">

            <ul style="list-style-type: none;margin: 0px;padding: 0px;">
                <li class="sty"><a href="#">总共<%=count%>页</a></li>
                <li class="sty"><a href="#">后一页</a></li>
                <%
                    for(int j=count;j>0;j--){
                %>
                <li class="sty"><a href="search.jsp?begin=<%=j/2%>"><%=j%></a></li>
                <%}%>
                <li class="sty"><a href="#">前一页</a></li>
            </ul>

        </div>
    </div> <!-- end of content -->
    <div id="templatemo_footer">
        Copyright © 2018 <a href="#"><strong>田亚峰</strong></a> |<a href="index.jsp" target="_parent">图书商城</a>
    </div> <!-- end of footer -->
    <!--  Free CSS Template www.cssmoban.com -->
</div> <!-- end of container -->
</body>
</html>