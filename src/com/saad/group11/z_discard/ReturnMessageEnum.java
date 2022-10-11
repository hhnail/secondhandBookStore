package com.saad.group11.z_discard;

//public enum ReturnMessageEnum {
//	Normal,//未申请退货
//	Wait,//未处理（等待处理）
//	Agree,//同意
//	Disagree;//拒绝
//}

public enum ReturnMessageEnum {
	Normal("未申请退货"),//未申请退货
	Wait("未处理"),//未处理（等待处理）
	Agree("同意"),//同意
	Disagree("拒绝");//拒绝
	
	
	private String state ;
	
	ReturnMessageEnum(String state){
		 this.state = state;
	}
	
	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}
	
	public static ReturnMessageEnum getFromState(String state) {
		for(ReturnMessageEnum returnMessageEnum:ReturnMessageEnum.values()) {
			if(returnMessageEnum.getState().equals(state)) {
				return returnMessageEnum;
			}
		}
		return null;
	}
}
