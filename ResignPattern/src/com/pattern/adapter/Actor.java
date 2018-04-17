package com.pattern.adapter;/*
 *ResignPattern
 *@author yafeng
 *2018-4-4
 *下午9:02
 * 演员类
 * 假若这是别人提供的代码,并且项目很庞大,代码极不容易改,而提供的接口与我们的接口不一样,
 * 而项目验收时间就快要到了,在不修改代码的前提下,我们改=该如何能保证完成任务?
 * 答案就是使用 适配器模式.
 */

public class Actor {
    public void actorWork(){
        System.out.println("演员工作是演电影!");
    }
}
