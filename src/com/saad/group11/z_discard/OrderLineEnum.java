package com.saad.group11.z_discard;

public enum OrderLineEnum {
	Wait,
	Agree,
	Disagree,
	Untreated("交易未完成"),//交易未完成
	Done;//交易完成
	/*
	 * 	常量后有（值）的就调用有参构造
	 * 	常量后没有（值）的就调用无参构造
	 * 	可以根据实际需求选择
	 */

	//其他成员列表
	private String des;//可以对这些对象进行一定的描述
	private OrderLineEnum(String des) {
		this.des = des;
	}
	private OrderLineEnum() {

	}
	//常量对象列表

}
