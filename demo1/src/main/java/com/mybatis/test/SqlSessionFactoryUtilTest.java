package com.mybatis.test;

import com.mybatis.map.StudentMapper;
import com.mybatis.role.Student;
import com.mybatis.util.SqlSessionFactoryUtil;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;

import java.util.HashMap;
import java.util.Map;

import static org.junit.Assert.*;

/*
 *demo1
 *@author yafeng
 *2018-4-8
 *下午8:26
 */
public class SqlSessionFactoryUtilTest {
    @Test
    public void test_01(){
        SqlSession sqlSession=null;
        SqlSessionFactory sqlSessionFactory;
        try{
             sqlSessionFactory =SqlSessionFactoryUtil.createSqlSessionFactory();
             sqlSession=sqlSessionFactory.openSession();
            StudentMapper studentMapper=(StudentMapper)sqlSession.getMapper(StudentMapper.class);

           /* Student student=new Student("shuanger",21,"nv");
            studentMapper.insertStudent(student);
            Student student1=studentMapper.searchStudent(1);
            System.out.println(student1.toString());
            Map<String,Student> map=new HashMap<String, Student>();
            map=studentMapper.studentMap();
            System.out.println(map);*/
           Student student2=studentMapper.searchStudentAndScore(1);
            System.out.println(student2);
            System.out.println(student2.getScore());
            sqlSession.commit();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            sqlSession.rollback();//回滚
            sqlSession.close();//关闭
        }

    }

}