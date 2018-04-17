package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:41
 */

public class MulOperation extends Operation {
    @Override
    public double operateResult() {
        return super.getNumberA()*super.getNumberB();
    }
}
