package com.experiment.util;/*
 *Experiment1
 *@author yafeng
 *2018-4-11
 *下午7:17
 * 使用单例模式创建数据库连接池对象
 * 获得数据库连接
 *
 */

import com.mchange.v2.c3p0.ComboPooledDataSource;
import org.junit.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class ConnectionUtil{
  /*  *//*
     * 创建连接池对象
     * */
    private static ComboPooledDataSource cpd= null;
    private static Connection connection=null;
    //类锁
    private final static Class Class_Block=ConnectionUtil.class;

    public static Connection getConnection() {
        try {
            if (cpd == null) {
                synchronized (Class_Block) {
                    if (cpd == null) {
                        cpd = new ComboPooledDataSource();
                        return cpd.getConnection();
                    }
                }

            }
            return cpd.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
        }
        /*
        * 关闭数据库连接
        * */
        public static void close(Connection connection, PreparedStatement preparedStatement, ResultSet resultSet){
        if(resultSet!=null){
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if(preparedStatement!=null){
            try {
                preparedStatement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        if (connection!=null){
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        }
   /* @Test
    public void test(){
       Connection c1=ConnectionUtil.getConnection();
       ComboPooledDataSource co1=ConnectionUtil.cpd;
       Connection c2=ConnectionUtil.getConnection();
       ComboPooledDataSource co2=ConnectionUtil.cpd;
        System.out.println(c1==c2);
        System.out.println(co1==co2);


    }*/

    }