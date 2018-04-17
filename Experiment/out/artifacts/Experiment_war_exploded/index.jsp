<%@ page import="java.util.List" %>
<%@ page import="com.experiment.dao.BookDao" %>
<%@ page import="com.experiment.model.Books" %>
<%--
  Created by IntelliJ IDEA.
  User: yafeng
  Date: 18-4-12
  Time: 上午8:57
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
<div id="templatemo_container">
  <div id="templatemo_menu">
    <ul>
      <li><a href="index.jsp" class="current">首页</a></li>
      <li><a href="login.jsp">登录</a></li>
      <li><a href="index.jsp">优惠活动</a></li>
      <li><a href="index.jsp">联系我们</a></li>
      <li>
        <form action="/search.do" method="post">
          <table align="right">
           <tr>
               <td>书名<input type="text" name="keywords" value="" placeholder="书名" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
             <td>作者<input type="text" name="author" value=""  placeholder="作者名" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
             <td>价格<input type="text" name="low_price"  placeholder="最低价格" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
               <td><input type="text" name="high_price"  placeholder="最高价格" style="width: 60px;height: 15px;border-radius: 5px;background-color: #873c19"/></td>
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
      <a href="detail.jsp" style="margin-left: 50px;">Read more...</a>
    </div>


    <div id="templatemo_new_books">
      <ul>
        <li>Spring  in action</li>
        <li>Java入门</li>
        <li>Python 21天从入门到精通</li>
      </ul>
      <a href="detail.jsp" style="margin-left: 50px;">Read more...</a>
    </div>
  </div> <!-- end of header -->
<%
  BookDao dao=BookDao.getInstaace();
  List<Books> books=dao.publishedLastFourDays();
  Books b;
%>


  <div id="templatemo_content">

    <div id="templatemo_content_left">
      <div class="templatemo_content_left_section">
        <h1>热书排行</h1>
        <ul>
          <%
            for(Books books1:books){
          %>
          <li><a href="detail.jsp?book_id=<%=books1.getId()%>"><%=books1.getBook_name()%></a></li>
        <%}%>
        </ul>
      </div>
      <div class="templatemo_content_left_section">
        <h1>新书首发</h1>
        <%
          for(Books books1:books){
        %>
        <li><a href="detail.jsp?book_id=<%=books1.getId()%>"><%=books1.getBook_name()%></a></li>
        <%}%>
      </div>
      <div class="templatemo_content_left_section">
        <a href="http://validator.w3.org/check?uri=referer"><img style="border:0;width:88px;height:31px" src="http://www.w3.org/Icons/valid-xhtml10" alt="Valid XHTML 1.0 Transitional" width="88" height="31" vspace="8" border="0" /></a>
        <a href="http://jigsaw.w3.org/css-validator/check/referer"><img style="border:0;width:88px;height:31px"  src="http://jigsaw.w3.org/css-validator/images/vcss-blue" alt="Valid CSS!" vspace="8" border="0" /></a>
      </div>
    </div> <!-- end of content left -->
    <%
      int i=0;
      int len=0;
      if(books!=null){
      for(i=0;i<books.size();i++){
        b=books.get(i);
        if(b.getScraption()!=null){
          len=(b.getScraption().length())/5;
        }

    %>
    <div id="templatemo_content_right">
      <div class="templatemo_product_box">
        <h1>书名:<%=b.getBook_name()%>  <span>作者:<%=b.getBook_author_name()%></span></h1>
        <img src="/images/templatemo_image_0<%=i+1%>.jpg" alt="image" />
        <div class="product_info">
          <p><%=b.getScraption().substring(0,len)%>...</p>
          <h3>价格:<%=b.getBook_price()%></h3>
          <div class="buy_now_button"><a href="detail.jsp?book_id=<%=b.getId()%>">购买</a></div>
          <div class="detail_button"><a href="detail.jsp?book_id=<%=b.getId()%>">详情</a></div>
        </div>
        <div class="cleaner">&nbsp;</div>
      </div>

      <div class="cleaner_with_width">&nbsp;</div>
        <%i++;
        if(i<books.size()){
          b=books.get(i);
          if(b.getScraption()!=null){
            len=(b.getScraption().length())/5;
          }
        %>
      <div class="templatemo_product_box">
        <h1>书名:<%=b.getBook_name()%>  <span>作者:<%=b.getBook_author_name()%></span></h1>
        <img src="/images/templatemo_image_0<%=i+1%>.jpg" alt="image" />
        <div class="product_info">
          <p><%=b.getScraption().substring(0,len)%>...</p>
          <h3>价格:<%=b.getBook_price()%></h3>
          <div class="buy_now_button"><a href="detail.jsp?book_id=<%=b.getId()%>">购买</a></div>
          <div class="detail_button"><a href="detail.jsp?book_id=<%=b.getId()%>">详情</a></div>
        </div>
        <div class="cleaner">&nbsp;</div>
      </div>

      <div class="cleaner_with_height">&nbsp;</div>

      <%
        }
          }
        }%>
    </div> <!-- end of content right -->

    <div class="cleaner_with_height">&nbsp;</div>
  </div> <!-- end of content -->

  <div id="templatemo_footer">
    Copyright © 2018 <a href="index.jsp"><strong>Copyright 田亚峰</strong></a> |<a href="http://www.cssmoban.com" target="_parent" title="图书商城">图书商城</a>	</div>
  <!-- end of footer -->
  <!--  Free CSS Template www.cssmoban.com -->
</div> <!-- end of container -->
</body>
</html>