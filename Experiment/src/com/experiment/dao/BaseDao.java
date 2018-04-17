package com.experiment.dao;/*
 *Experiment1
 *@author yafeng
 *2018-4-11
 *下午7:57
 * 数据库操作通用类
 */

import com.experiment.util.ConnectionUtil;
import org.junit.Test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BaseDao {
    private  static BaseDao baseDao;
    public PreparedStatement preparedStatement = null;
    public Connection connection = null;
    public ResultSet resultSet=null;

    /*
    * 获得该类单例对象
    * */
    public static BaseDao getInstance(){
        if(baseDao==null){
            baseDao=new BaseDao();
        }
        return baseDao;
    }

    /*
     * @parameter sql
     * @parameter args[]
     * */
    public boolean exeucteUpdate(String sql, Object args[]) {
        //获得数据库连接对象
        connection = ConnectionUtil.getConnection();

        try {
            //创建预处理命令对象
            preparedStatement = connection.prepareStatement(sql);
            //给占位符赋值
            for (int i = 0; i < args.length; i++) {
                preparedStatement.setObject(i + 1, args[i]);
            }
            /*
             * executeUpdate:更新成功返回影响的行数
             * 行数>0 说明更新成功,否则失败
             * */
            return preparedStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            //断开数据库连接
            ConnectionUtil.close(connection,preparedStatement,null);
        }

        return false;
    }
    public BaseDao executeQuery(String sql,Object args[]){
        BaseDao con_pre_res=new BaseDao();
        //获得数据库连接
        connection=ConnectionUtil.getConnection();
        //创建预处理命令对象
        try {
            preparedStatement=connection.prepareStatement(sql);
            //给占位符赋值
            for(int i=0;i<args.length;i++){
                preparedStatement.setObject(i+1,args[i]);
            }
            //执行查询操作,返回结果集
            resultSet=preparedStatement.executeQuery();
            con_pre_res.resultSet=resultSet;
            con_pre_res.preparedStatement=preparedStatement;
            con_pre_res.connection=connection;
            return con_pre_res;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
/*    @Test
    public void test_02(){
        BaseDao b1=BaseDao.getInstance();
        BaseDao b2=BaseDao.getInstance();
        System.out.println(b1==b2);
        System.out.println(b1.toString());
    }*/
}
