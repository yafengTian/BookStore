package com.mybatis.util;/*
 *demo1
 *@author yafeng
 *2018-4-8
 *下午8:07
 *
 * 应用单例模式创建SqLSessionFactoryt
 */

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SqlSessionFactoryUtil {
    //SqlSessionFactory对象
    private static SqlSessionFactory sqlSessionFactory=null;
    //对象锁
    private static final Class CLASS_CLOCK=SqlSessionFactory.class;
    //私有化构造函数,防止外部创建
    private SqlSessionFactoryUtil(){}

    //获取SQLSessionFactory对象
    public static SqlSessionFactory createSqlSessionFactory(){
        String resource="mybatis-conf.xml";
        try {
            InputStream inputStream=Resources.getResourceAsStream(resource);
            /*
            * 双层判断,实现单例模式
            * 用synchronized同步,防止发生线程不安全
            * */
            if(sqlSessionFactory==null){
                synchronized(CLASS_CLOCK){
                    if(sqlSessionFactory==null){
                        sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
                    }
                }
            }
        } catch (IOException e) {
            //追踪日志信息
          //  Logger.getLogger(SqlSessionFactoryUtil.class.getName()).log(Level.SEVERE,null,e);
            e.printStackTrace();
        }
        return sqlSessionFactory;
    }

    public static SqlSession openSqlSession(){
        if(sqlSessionFactory==null){
            createSqlSessionFactory();
        }
        return sqlSessionFactory.openSession();
    }
}
