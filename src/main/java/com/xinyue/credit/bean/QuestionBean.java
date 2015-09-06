package com.xinyue.credit.bean;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年8月5日
 * @上午11:19:45
 */
public class QuestionBean implements Serializable {

	private int verify;//待审核
	private int fail;//审核失败
	private int pass;//审核通过
	private int total;
	private int rate;//审核通过率
	private int today;
	private int yesterday;
	private int rank;
	public int getVerify() {
		return verify;
	}
	public void setVerify(int verify) {
		this.verify = verify;
	}
	public int getFail() {
		return fail;
	}
	public void setFail(int fail) {
		this.fail = fail;
	}
	public int getPass() {
		return pass;
	}
	public void setPass(int pass) {
		this.pass = pass;
	}
	public int getRate() {
		return rate;
	}
	public void setRate(int rate) {
		this.rate = rate;
	}
	public int getToday() {
		return today;
	}
	public void setToday(int today) {
		this.today = today;
	}
	public int getYesterday() {
		return yesterday;
	}
	public void setYesterday(int yesterday) {
		this.yesterday = yesterday;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	
}
