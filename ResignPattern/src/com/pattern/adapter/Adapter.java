package com.pattern.adapter;/*
 *ResignPattern
 *@author yafeng
 *2018-4-4
 *下午9:02
 * 适配器类
 * 假若该类是别人提供的,其接口和我们的目标接口不一样,为了不修改代码就能使用
 * 所以此时就需要一个适配器
 * 适配器作用就是将不符合的接口转为我们的目标接口,适应需求!
 */

public class Adapter extends People {
    private Actor actor=new Actor();
    @Override
    public void work() {
        actor.actorWork();
    }
}
