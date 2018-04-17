package com.experiment.servlet;

import com.experiment.dao.BookDao;
import com.experiment.model.Books;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/*
 *Experiment
 *@author yafeng
 *2018-4-13
 *下午3:47
 */
@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    BookDao dao=BookDao.getInstaace();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keywords=request.getParameter("keywords");
        String author=request.getParameter("author");
        String low=request.getParameter("low_price");
        String high=request.getParameter("high_price");
        double low_price=-1;
        double high_price=-1;
        if(low!=""){
            low_price=Double.parseDouble(low);
        }
        if(high!=""){
            high_price=Double.parseDouble(high);
        }
        List<Books>  books=dao.searchBook(keywords,author,low_price,high_price);
        request.getSession().setAttribute("books",books);
        response.sendRedirect("search.jsp?begin="+0);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request,response);
    }
}
