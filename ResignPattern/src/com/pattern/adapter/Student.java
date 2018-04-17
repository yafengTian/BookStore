package com.pattern.adapter;/*
 *ResignPattern
 *@author yafeng
 *2018-4-4
 *下午9:00
 */

public class Student extends People {
    @Override
    public void work() {
        System.out.println("学生工作是学习!");
    }
}
