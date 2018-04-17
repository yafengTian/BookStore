package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:39
 */

public class SubOperation extends Operation {

    //实现父类方法
    @Override
    public double operateResult() {
        return  super.getNumberA()-super.getNumberB();
    }
}
