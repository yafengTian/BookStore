<%@ page import="com.experiment.dao.BookDao" %>
<%@ page import="java.util.List" %>
<%@ page import="com.experiment.model.Books" %><%--
  Created by IntelliJ IDEA.
  User: yafeng
  Date: 18-4-13
  Time: 下午2:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>图书商城</title>
    <link rel="icon" href="/images/2.jpg" type="image/x-incon">
    <meta name="keywords" content="Book Store Template, Free CSS Template, CSS Website Layout, CSS, HTML" />
    <meta name="description" content="Book Store Template, Free CSS Template, Download CSS Website" />
    <link href="/css/templatemo_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<!--  网站模板 from www.cssmoban.com -->
<%
        String b_id=request.getParameter("book_id");
    System.out.println(b_id);
    BookDao dao=BookDao.getInstaace();
        int book_id=0;
        if(b_id!=null){

            book_id=Integer.parseInt(b_id);System.out.println(book_id);
        }
        List<Books> books=dao.searchBook(book_id);
%>
<div id="templatemo_container">
    <div id="templatemo_menu">
        <ul>
            <li><a href="index.jsp" class="current">首页</a></li>
            <li><a href="index.jsp">优惠活动</a></li>
            <li><a href="index.jsp">联系我们</a></li>
            <li>
                <form action="/search.do" method="post">
                    <table align="right">
                        <tr>
                            <td>书名<input type="text" name="keywords" placeholder="书名" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
                            <td>作者<input type="text" name="author"  placeholder="作者名" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
                            <td>价格<input type="text" name="low_price" placeholder="最低价格" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
                            <td><input type="text" name="high_price" placeholder="最高价格" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
                            <td><input type="submit" value="查询" style="width: 60px;height: 25px;border-radius: 5px;background-color: #873c19"/> </td>
                        </tr>
                    </table>
                </form>
            </li>
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
                    <li><a href="#">Donec accumsan urna</a></li>
                </ul>
            </div>
            <div class="templatemo_content_left_section">
                <h1>Bestsellers</h1>
                <ul>
                    <li><a href="#">Vestibulum ullamcorper</a></li>
                </ul>
            </div>

            <div class="templatemo_content_left_section">
                <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
                <a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" vspace="8" border="0" /></a>
            </div>
        </div> <!-- end of content left -->
<%
    if(books.size()>0){

%>
        <div id="templatemo_content_right">

            <h1>书名:<%=books.get(0).getBook_name()%></h1>
            <div class="image_panel"><img src="images/templatemo_image_02.jpg" alt="CSS Template" width="100" height="150" /></div>
            <h2>Read the lessons - Watch the videos - Do the exercises</h2>
            <ul>
                <li><span>作者:<%=books.get(0).getBook_author_name()%></span></li>
                <li><span>时间:<%=books.get(0).getBook_publish_date()%></span></li>
                <li><span>价格:<%=books.get(0).getBook_price()%></span></li>
                <li>ISBN 10: 0-496-91612-0 | ISBN 13: 9780492518154</li>
            </ul>

            <p><%=books.get(0).getScraption()%></p>

            <div class="cleaner_with_height">&nbsp;</div>

            <a href="index.jsp"><img src="images/templatemo_ads.jpg" alt="css template ad" /></a>

        </div> <!-- end of content right -->

        <div class="cleaner_with_height">&nbsp;</div>
        <%}%>
    </div> <!-- end of content -->

    <div id="templatemo_footer">
        Copyright © 2018 <a href="#"><strong>田亚峰</strong></a> |<a href="index.jsp" target="_parent">图书商城</a>
    </div> <!-- end of footer -->
    <!--  Free CSS Template www.cssmoban.com -->
</div> <!-- end of container -->
</body>
</html>
