package com.xinyue.credit.bean;

import java.io.Serializable;

import com.xinyue.manage.util.CommonFunction;

/**
 * 
 * @author wenhai.you
 * @2015年7月23日
 * @上午9:44:23
 */
public class RecommendMember implements Serializable {

	private String ordinary = CommonFunction.getValue("recommend.ordinary.member");
	private String ordinaryTel;
	private String ordinaryLink;
	private String ordinaryEmail;
	private String ordinaryNum;
	private String ordinaryScore;
	
	public String getOrdinaryLink() {
		return ordinaryLink;
	}
	public void setOrdinaryLink(String ordinaryLink) {
		this.ordinaryLink = ordinaryLink;
	}
	public String getOrdinary() {
		return ordinary;
	}
	public void setOrdinary(String ordinary) {
		this.ordinary = ordinary;
	}
	public String getOrdinaryTel() {
		return ordinaryTel;
	}
	public void setOrdinaryTel(String ordinaryTel) {
		this.ordinaryTel = ordinaryTel;
	}
	public String getOrdinaryEmail() {
		return ordinaryEmail;
	}
	public void setOrdinaryEmail(String ordinaryEmail) {
		this.ordinaryEmail = ordinaryEmail;
	}
	public String getOrdinaryNum() {
		return ordinaryNum;
	}
	public void setOrdinaryNum(String ordinaryNum) {
		this.ordinaryNum = ordinaryNum;
	}
	public String getOrdinaryScore() {
		return ordinaryScore;
	}
	public void setOrdinaryScore(String ordinaryScore) {
		this.ordinaryScore = ordinaryScore;
	}
}
