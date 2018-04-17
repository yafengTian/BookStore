package com.experiment.dao;/*
 *Experiment
 *@author yafeng
 *2018-4-12
 *下午12:38
 *
 */

import com.experiment.model.User;
import com.experiment.util.ConnectionUtil;
import org.junit.Test;
import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;

public class UserDao {
    /*
    * user login
    * @parameter user_id
    * @parameter password
    * */
    private  static UserDao userDao=null;
    private BaseDao dao=BaseDao.getInstance();
    /*
    * 创建单例对象
    * */
    public static UserDao getInstance(){
        if(userDao==null){
            userDao=new UserDao();
            return  userDao;
        }
        return userDao;
    }

    public User userLogin(long user_id,String password) {
        System.out.println(user_id+password);
        String sql = "select * from User where user_id=? and password=?";
        //md5加密
        MessageDigest md5= null;
        String pwd=null;
        try {
            BASE64Encoder base64en = new BASE64Encoder();
            md5 = MessageDigest.getInstance("MD5");
             pwd=base64en.encode(md5.digest(password.getBytes("utf-8")));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        BaseDao baseDao = dao.executeQuery(sql, new Object[]{user_id, pwd});
        ResultSet resultSet =baseDao.resultSet;
        if (resultSet != null) {
            try {
                while (resultSet.next()) {
                    String user_name = resultSet.getString("user_name");
                    String sex = resultSet.getString("sex");
                    int age = resultSet.getInt("age");
                    Date date = resultSet.getDate("birthday");
                    java.sql.Date birthday = new java.sql.Date(date.getTime());
                    User user = new User(user_id, user_name, password, sex, age, birthday);
                    return user;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                ConnectionUtil.close(baseDao.connection,baseDao.preparedStatement,baseDao.resultSet);
            }
        }
        return null;
    }
    /*
     * check the username weather exists
     * @parameter username
     * @return if exists return true ,else return false
     * */
    public boolean userIsExists(String user_name){
        String sql="select * from User where user_name=?";
        BaseDao baseDao=dao.executeQuery(sql,new Object[]{user_name});
        return isBoolean(baseDao);
    }
    /*
    * user register
    * @parameter user
    * */
    public boolean userRegister(User user){
        String sql="insert into User(user_id,user_name,password,sex,age,birthday)" +
                "values(?,?,?,?,?,?)";
        /*
        * username is not exists
        * */
        if(!userIsExists(user.getUser_name())){
            try {
                //md5加密
                MessageDigest md5=MessageDigest.getInstance("MD5");
                BASE64Encoder base64en = new BASE64Encoder();
                //加密后的字符串
                String pwd=base64en.encode(md5.digest(user.getPassword().getBytes("utf-8")));
                boolean count=dao.exeucteUpdate(sql,new Object[]{user.getUser_id(),user.getUser_name(),
                        pwd,user.getSex(),user.getAge(),user.getBirthday()});
                return count;
            } catch (NoSuchAlgorithmException e) {
                e.printStackTrace();
            }catch (Exception e) {
                e.printStackTrace();
            }
        }
            return  false;
    }
    /*
     * check the resultSet whether is null
     * */
   // ResultSet resultSet=null;
    public boolean isBoolean(BaseDao baseDao) {
        if (baseDao.resultSet != null) {
            try {
                while (baseDao.resultSet.next()) {
                    int id = baseDao.resultSet.getInt("id");
                    return id > 0;
                }
            } catch (Exception e) {
                e.printStackTrace();
            }finally {
                ConnectionUtil.close(baseDao.connection,baseDao.preparedStatement,baseDao.resultSet);
            }
        }
        return false;
    }

    @Test
    public void test_03(){
        /*Date d=new Date();
        java.sql.Date date=new java.sql.Date(d.getTime());
        User user=new User(19396084,"feng","tyf0920","nan",21,date);
        System.out.println(userRegister(user));*/
        System.out.println(userLogin(19396084,"tyf0920"));
     //   System.out.println(userIsExists("shuanger"));
    }
}
