package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:45
 */

public class OperationFactory {
    public static Operation creatOperation(String operate)
    {
        Operation operation=null;
        switch (operate){
            case "+":
                operation=new AddOperation(); break;
            case "-":
                operation=new SubOperation();break;
            case "*":
                operation=new MulOperation();break;
            case "/":
                operation=new DevOperation();break;
        }
        return operation;
    }
}
