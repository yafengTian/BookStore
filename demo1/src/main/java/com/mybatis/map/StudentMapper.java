package com.mybatis.map;/*
 *demo1
 *@author yafeng
 *2018-4-8
 *下午6:55
 */

import com.mybatis.role.Student;
import org.apache.ibatis.annotations.MapKey;

import java.util.List;
import java.util.Map;

public interface StudentMapper {
    /*
    * 插入记录
    * */
    public void insertStudent(Student student);

    /*
    * 删除记录
    * by id
    * */
    public void deleteStudent(int id);

    /*
    * 查找记录
    * by id
    * */
    public Student searchStudent(int id);

    /*
    * 返回所有学生
    * */
    public List<Student> studentList();

    /*
    * 将学习信息以map形式返回
    * */
    @MapKey("student_name")  //指明将student_name作为map的key
    public Map<String,Student> studentMap();

    /*
     * 查询学生信息以及成绩
     * */
    public Student searchStudentAndScore(Integer id);

    /*
    * 更新记录
    * */

    public void updateStudent(Student student);
}
