package com.experiment.servlet;

import com.experiment.dao.BookDao;
import com.experiment.model.Books;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/*
 *Experiment
 *@author yafeng
 *2018-4-14
 *上午9:28
 */
@WebServlet(name = "UpdateServlet")
public class UpdateServlet extends HttpServlet {
    BookDao dao=BookDao.getInstaace();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String book_id=request.getParameter("book_id");
       String book_name=request.getParameter("book_name");
        String book_author=request.getParameter("book_author");
        String b_price=request.getParameter("book_price");
        String date=request.getParameter("book_publish_date");
        String scraption=request.getParameter("scraption");
        double book_price=0;
        Date publish_date=null;
        int id=0;
        if(book_id!=""&&b_price!=""&&date!=""&&book_author!=""){
            id=Integer.parseInt(book_id);
            book_price=Double.parseDouble(b_price);
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-MM-dd");
            try {
                publish_date=new Date(simpleDateFormat.parse(date).getTime());
            } catch (ParseException e) {
                e.printStackTrace();
            }
        }
        Books books=new Books(id,book_name,publish_date,book_price,book_author,scraption);
        boolean flag=dao.updateBook(books);
        if(flag){
            response.sendRedirect("back.jsp?begin="+0);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            doPost(request,response);
    }
}
