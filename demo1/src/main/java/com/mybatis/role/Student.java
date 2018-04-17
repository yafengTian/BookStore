package com.mybatis.role;/*
 *demo1
 *@author yafeng
 *2018-4-8
 *下午6:53
 */

public class Student {
    private Integer id;
    private String studentName;
    private Integer student_age;
    private String student_gender;
    private Score score;

    public Student(){}

    public Student(Integer id, String studentName, Integer student_age, String student_gender) {
        this.id = id;
        this.studentName = studentName;
        this.student_age = student_age;
        this.student_gender = student_gender;
    }

    public Student(String studentName, Integer student_age, String student_gender) {
        this.studentName = studentName;
        this.student_age = student_age;
        this.student_gender = student_gender;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getStudentName() {
        return studentName;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
    }

    public Integer getStudent_age() {
        return student_age;
    }

    public void setStudent_age(Integer student_age) {
        this.student_age = student_age;
    }

    public String getStudent_gender() {
        return student_gender;
    }

    public void setStudent_gender(String student_gender) {
        this.student_gender = student_gender;
    }

    public Score getScore() {
        return score;
    }

    public void setScore(Score score) {
        this.score = score;
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", studentName='" + studentName + '\'' +
                ", student_age=" + student_age +
                ", student_gender='" + student_gender + '\'' +
                '}';
    }
}
