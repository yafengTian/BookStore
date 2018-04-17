package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:42
 */

public class DevOperation extends Operation {

    @Override
    public double operateResult(){
        if(super.getNumberB()==0)
        {
            try {
                throw new Exception("除数为0");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        return super.getNumberA()/super.getNumberB();
    }
}
