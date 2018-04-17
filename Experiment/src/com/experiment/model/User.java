package com.experiment.model;/*
 *Experiment1
 *@author yafeng
 *2018-4-11
 *下午8:48
 * 用户类
 */

import java.sql.Date;

public class User {
    private long user_id;//用户用来登录
    private String user_name;
    private String password;
    private String sex;
    private int age;
    private Date birthday;

    public User(){}

    public User(long user_id, String user_name, String password, String sex, int age, Date birthday) {
        this.user_id = user_id;
        this.user_name = user_name;
        this.password = password;
        this.sex = sex;
        this.age = age;
        this.birthday = birthday;
    }

    public long getUser_id() {
        return user_id;
    }

    public void setUser_id(long user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Override
    public String toString() {
        return "User{" +
                "user_id=" + user_id +
                ", user_name='" + user_name + '\'' +
                ", password='" + password + '\'' +
                ", sex='" + sex + '\'' +
                ", age=" + age +
                ", birthday=" + birthday +
                '}';
    }
}
