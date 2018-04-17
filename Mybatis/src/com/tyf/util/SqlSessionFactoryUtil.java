package com.tyf.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
/*
 * 使用SQLSessionFactoryBuilder创建SQLSessionFactory,
 * 并使用SqlSessionFactory创建Session
 * 
 * */
public class SqlSessionFactoryUtil {
	//SqlSessionFactory对象
	private static SqlSessionFactory sqlSessionFactory=null;
	//类线程锁
	private static final Class CLASS_CLOCK=SqlSessionFactoryUtil.class;
	
	/*
	 * 私有化构造函数，防止使用者外部创建SQLSessionFactory
	 * 单例模式
	 * */
	private SqlSessionFactoryUtil(){}
	
	/*
	 * 构建SqlSessionFactory
	 * */
	public static SqlSessionFactory initSqlSessionFactory(){
		String resource="mybatis.xml";
		InputStream inputStream=null;
		try{
			inputStream=Resources.getResourceAsStream(resource);
		}catch(IOException ex){
			Logger .getLogger(SqlSessionFactoryUtil.class.getName()).log(Level.SEVERE,null,ex);
		}
		synchronized (CLASS_CLOCK) {
		if(sqlSessionFactory==null){
			sqlSessionFactory=new SqlSessionFactoryBuilder().build(inputStream);
		}
		}
		return sqlSessionFactory;
	}
	
	/*
	 * 打开SQLSession
	 * */
	public static SqlSession openSqlSession(){
		if(sqlSessionFactory==null){
			initSqlSessionFactory();
		}
		return sqlSessionFactory.openSession();
	}
}
