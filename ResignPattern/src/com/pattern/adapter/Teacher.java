package com.pattern.adapter;/*
 *ResignPattern
 *@author yafeng
 *2018-4-4
 *下午9:01
 */

public class Teacher extends People{

    @Override
    public void work() {
        System.out.println("老师工作是教书育人!");
    }
}
