package com.xinyue.credit.bean;

import java.io.Serializable;

import com.xinyue.manage.util.CommonFunction;

/**
 * 
 * @author wenhai.you
 * @2015年7月23日
 * @上午9:44:23
 */
public class RecommendCredit implements Serializable {

	private String credit = CommonFunction.getValue("recommend.credit.member");
	private String creditTel;
	private String creditLink;
	private String creditEmail;
	private String creditNum;
	private String creditScore;
	
	public String getCreditLink() {
		return creditLink;
	}
	public void setCreditLink(String creditLink) {
		this.creditLink = creditLink;
	}
	public String getCredit() {
		return credit;
	}
	public void setCredit(String credit) {
		this.credit = credit;
	}
	public String getCreditTel() {
		return creditTel;
	}
	public void setCreditTel(String creditTel) {
		this.creditTel = creditTel;
	}
	public String getCreditEmail() {
		return creditEmail;
	}
	public void setCreditEmail(String creditEmail) {
		this.creditEmail = creditEmail;
	}
	public String getCreditNum() {
		return creditNum;
	}
	public void setCreditNum(String creditNum) {
		this.creditNum = creditNum;
	}
	public String getCreditScore() {
		return creditScore;
	}
	public void setCreditScore(String creditScore) {
		this.creditScore = creditScore;
	}
	
}
