package com.pattern.adapter;/*
 *ResignPattern
 *@author yafeng
 *2018-4-4
 *下午9:11
 */

public class Test {
    public static void main(String[] args) {
        //学生对象
        People student=new Student();
        student.work();

        //老师对象
        People teacher=new Teacher();
        teacher.work();

        //演员对象
        People actor=new Adapter();
        actor.work();

    }
}
