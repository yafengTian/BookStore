package com.tyf.Junit4;

import org.junit.Test;

public class HelloWorld {
	private String name="yafeng";
	private int age;
	public HelloWorld(){}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	
	public void show(){
		System.out.println("Name:"+this.name);
	}
	
	@Test
	public void test_01(){
		this.show();
	}

}
