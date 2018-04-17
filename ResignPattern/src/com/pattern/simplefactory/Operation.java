package com.pattern.simplefactory;/*
 *ResignPattern
 *@author yafeng
 *2018-4-2
 *下午7:27
 *
 * 软件设计模式之简单的工厂模式
 * 面性对象的三大特性:继承,封装,多态
 * 尽可能的使用面向对象,使得代码更加灵活,可扩张,易维护
 */

/*
* 计算器操作类
* 封装计算器的加减乘除的功能方法,为没每类计算写一个操作类
* 好处:容易扩展,维护,更加灵活
* 不足:如果项目太大,就需要写好多的类,工作量较大
*
* */
public  class Operation {

    private double numberA;//操作数A
    private  double numberB;//操作数B

    public double getNumberA() {
        return numberA;
    }

    public void setNumberA(double numberA) {
        this.numberA = numberA;
    }

    public double getNumberB() {
        return numberB;
    }

    public void setNumberB(double numberB) {
        this.numberB = numberB;
    }
//抽象方法,提供统一接口
    public double operateResult(){
        double result=0;
        return result;
    }
}
