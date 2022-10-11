package com.saad.group11.test;

public class Test {
	public static void main(String[] args) {
		int parseInt = 1;
		String str = "zz";
		
		try {
			parseInt = Integer.parseInt(str);
		} catch (NumberFormatException e) {
			System.out.println("类型转换异常！！");
		}
		
		System.out.println(parseInt);

	}
}
