package com.experiment.dao;/*
 *Experiment
 *@author yafeng
 *2018-4-12
 *下午12:38sss
 */

import com.experiment.model.Books;
import com.experiment.util.ConnectionUtil;
import org.junit.Test;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class BookDao {
    private BaseDao dao=BaseDao.getInstance();
    private static BookDao bookDao=null;
    /*
    * 创建单例对象
    * */
    public static BookDao getInstaace(){
        if(bookDao==null){
            bookDao=new BookDao();
            return bookDao;
        }
        return bookDao;
    }
    /*
    * add books to the libary
    * @parameter books
    * @return boolean
    * */
    public boolean addBook(Books books){
        String sql="insert into Book(book_name,book_publish_date,book_author,book_price,scraption)values(?,?,?,?,?)";
        boolean flag=dao.exeucteUpdate(sql,new Object[]{books.getBook_name(),books.getBook_publish_date(),
                books.getBook_author_name(),books.getBook_price(),books.getScraption()});
        return flag;
    }

    /*
    * delete the book from libary by id
    * @parameter book_id
    * @return boolean
    * */
    public boolean deleteBook(int book_id[]){
        String sql="delete from Book where id=?";
        for (int i=0;i<book_id.length;i++){
           if( !dao.exeucteUpdate(sql,new Object[]{book_id[i]})){
               return false;
           }
        }
        return true;
    }
    /*
    * user can search books by book_name,author and the price
    * @parameter low_price  user can accept the low price
    * @parameter high_price user can accept the high price
    * @return List<Books>
    * */
    public List<Books> searchBook(String keywords,String author,double low_price,double high_price){
        /*
        * search books by keywords of book_name
        * */
        List<Books> books=null;
        ResultSet resultSet=null;
        if(keywords!=""&&author==""&&low_price<0&&high_price<0){
            String sql="select * from Book where book_name like '%"+keywords+"%'";
            BaseDao baseDao=dao.executeQuery(sql,new Object[]{});
            books=resultSetToBook(baseDao);
            return books;
        }//search books by keywords and author
        else if(keywords!=""&&author!=""&&low_price<0&&high_price<0){
            String sql="select * from Book b where b.book_name like '%keywords=?%' and book_author=?";
            BaseDao baseDao=dao.executeQuery(sql,new Object[]{keywords,author});
            books=resultSetToBook(baseDao);
            return books;
        }//search books by author
        else if(keywords==""&&author!=""&&low_price<0&&high_price<0){
            String sql="select * from Book b where book_author=?";
            BaseDao baseDaot=dao.executeQuery(sql,new Object[]{author});
            books=resultSetToBook(baseDaot);
            return books;
        }
        else if(keywords==""&&author==""&&low_price>0&&high_price>0){
            String sql="select * from Book b where book_price>? and book_price<?";
            BaseDao baseDao=dao.executeQuery(sql,new Object[]{low_price,high_price});
            books=resultSetToBook(baseDao);
            return books;
        }
        //search books by keywords and price
        else if(keywords!=""&&author!=""&&low_price>0&&high_price>0){
            String sql="select * from Book b where b.book_name like '%"+keywords+"%' " +
                    "and book_author=? and book_price>? and book_price<?";
            BaseDao baseDao=dao.executeQuery(sql,new Object[]{author,low_price,high_price});
            books=resultSetToBook(baseDao);
            return books;
        }
        return  null;
    }
    /*
    * search book by book_id
    * */
    public List<Books> searchBook(int book_id){
        String sql="select * from Book where id=?";
        BaseDao baseDao =dao.executeQuery(sql,new Object[]{book_id});
        return resultSetToBook(baseDao);
    }

    /*
    * update the book's information
    * @parameter books
    * @return boolean
    * */
    public boolean updateBook(Books books){
        String sql="update Book set book_name=?,book_publish_date=?,book_author=?,book_price=?,scraption=? where id=?";
        boolean flag=dao.exeucteUpdate(sql,new Object[]{books.getBook_name(),books.getBook_publish_date(),
                books.getBook_author_name(),books.getBook_price(),books.getScraption(),books.getId()});
        return flag;
    }
    /*
    * the mapping between resultSet and Books
    * @return List<Books>
    *
    * */
    public List<Books> showAllBooks(){
        String sql="select * from Book";
        BaseDao baseDao=dao.executeQuery(sql,new Object[]{});
        List<Books> list=new ArrayList<>();
        list=resultSetToBook(baseDao);
        return list;
    }

    /*
    * show the books which are published  the last 4 days
    * @return List<Books>
    * */
    public List<Books> publishedLastFourDays(){
        String sql="select * from Book order by  book_publish_date desc limit 4";
        BaseDao baseDao=dao.executeQuery(sql,new Object[]{});
        List<Books> books=resultSetToBook(baseDao);
        ConnectionUtil.close(baseDao.connection,baseDao.preparedStatement,baseDao.resultSet);
        return books;
    }
    public List<Books>  resultSetToBook(BaseDao baseDao){
        Books books=null;
        List<Books> list=new ArrayList<Books>();
        ResultSet resultSet=baseDao.resultSet;
        if(resultSet!=null){
            try{
                while(resultSet.next()){
                    int id=resultSet.getInt("id");
                    String book_name=resultSet.getString("book_name");
                    String book_author=resultSet.getString("book_author");
                    String scraption=resultSet.getString("scraption");
                    double book_price=resultSet.getDouble("book_price");
                    java.sql.Date book_publish_date=resultSet.getDate("book_publish_date");
                    Date date=new Date(book_publish_date.getTime());
                    books=new Books(id,book_name,book_publish_date,book_price,book_author,scraption);
                    list.add(books);
                }
            }catch (Exception e){
                e.printStackTrace();
            }finally {
                ConnectionUtil.close(baseDao.connection,baseDao.preparedStatement,baseDao.resultSet);
            }
        }
        return  list;
    }

   @Test
    public void test_04() {
       /* Date date=new Date();
       java.sql.Date d=new java.sql.Date(date.getTime());
        Books books=new Books(5,"C++指针",d,21,"yuanfang","kkkkk");*/
       //System.out.println(searchBook("Java","",-1,-1));
       System.out.println(publishedLastFourDays());
   }

}
