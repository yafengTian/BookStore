package com.experiment.model;/*
 *Experiment1
 *@author yafeng
 *2018-4-11
 *下午8:48
 *
 * 图书信息类
 */

import java.util.Date;

public class Books {
    int id;
    private String book_name;
    private Date book_publish_date;
    private double book_price;
    private String book_author_name;
    private String scraption;
    public Books(){}

    public Books(int id, String book_name, Date book_publish_date, double book_price, String book_author_name, String scraption) {
        this.id = id;
        this.book_name = book_name;
        this.book_publish_date = book_publish_date;
        this.book_price = book_price;
        this.book_author_name = book_author_name;
        this.scraption = scraption;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getBook_name() {
        return book_name;
    }

    public void setBook_name(String book_name) {
        this.book_name = book_name;
    }

    public Date getBook_publish_date() {
        return book_publish_date;
    }

    public void setBook_publish_date(Date book_publish_date) {
        this.book_publish_date = book_publish_date;
    }

    public double getBook_price() {
        return book_price;
    }

    public void setBook_price(double book_price) {
        this.book_price = book_price;
    }

    public String getBook_author_name() {
        return book_author_name;
    }

    public void setBook_author_name(String book_author_name) {
        this.book_author_name = book_author_name;
    }

    public String getScraption() {
        return scraption;
    }

    public void setScraption(String scraption) {
        this.scraption = scraption;
    }

    @Override
    public String toString() {
        return "Books{" +
                "id=" + id +
                ", book_name='" + book_name + '\'' +
                ", book_publish_date=" + book_publish_date +
                ", book_price=" + book_price +
                ", book_author_name='" + book_author_name + '\'' +
                ", scraption='" + scraption + '\'' +
                '}';
    }
}
