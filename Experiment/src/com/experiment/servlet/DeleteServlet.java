package com.experiment.servlet;

import com.experiment.dao.BookDao;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/*
 *Experiment
 *@author yafeng
 *2018-4-13
 *下午9:15
 */
@WebServlet(name = "DeleteServlet")
public class DeleteServlet extends HttpServlet {
    BookDao dao=BookDao.getInstaace();
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String []b_id=request.getParameterValues("box");
        int []book_id=new int[b_id.length];
        for(int i=0;i<b_id.length;i++){
            book_id[i]=Integer.parseInt(b_id[i]);
        }
        boolean flag= dao.deleteBook(book_id);
        if(flag){
            response.sendRedirect("back.jsp?begin="+0);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
