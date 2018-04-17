package com.mybatis.role;/*
 *demo1
 *@author yafeng
 *2018-4-9
 *上午10:20
 */

public class Score {
    private Integer Id;
    private Integer english;
    private Integer math;

    public Score(){}

    public Score(Integer id, Integer english, Integer math) {
        Id = id;
        this.english = english;
        this.math = math;
    }

    public Integer getId() {
        return Id;
    }

    public void setId(Integer id) {
        Id = id;
    }

    public Integer getEnglish() {
        return english;
    }

    public void setEnglish(Integer english) {
        this.english = english;
    }

    public Integer getMath() {
        return math;
    }

    public void setMath(Integer math) {
        this.math = math;
    }

    @Override
    public String toString() {
        return "Score{" +
                "Id=" + Id +
                ", english=" + english +
                ", math=" + math +
                '}';
    }
}
