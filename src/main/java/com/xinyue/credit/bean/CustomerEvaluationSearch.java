package com.xinyue.credit.bean;

/**
 * 客户评价检索
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
public class CustomerEvaluationSearch {

	private int starLevel = 0;
	
	private int page = 0;

	/**
	 * @return the starLevel
	 */
	public int getStarLevel() {
		return starLevel;
	}

	/**
	 * @param starLevel the starLevel to set
	 */
	public void setStarLevel(int starLevel) {
		this.starLevel = starLevel;
	}

	/**
	 * @return the page
	 */
	public int getPage() {
		return page;
	}

	/**
	 * @param page the page to set
	 */
	public void setPage(int page) {
		this.page = page;
	}
}
