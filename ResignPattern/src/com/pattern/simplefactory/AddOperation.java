package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:36
 */

public class AddOperation  extends Operation {

    //实现父类的抽象方法
    @Override
    public double operateResult() {
        double result=0;
         result=super.getNumberA()+super.getNumberB();
         return result;
     }
}
