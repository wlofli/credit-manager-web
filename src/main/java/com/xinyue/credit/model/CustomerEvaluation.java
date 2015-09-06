package com.xinyue.credit.model;

import java.io.Serializable;

/**
 * 客户评价
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
public class CustomerEvaluation implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 5614114490963795574L;

	private String orderId;
	
	private String productName;
	
	private String applicant;
	
	private String evaluationTime;
	
	private String starLevel;
	
	private String starName;

	/**
	 * @return the orderId
	 */
	public String getOrderId() {
		return orderId;
	}

	/**
	 * @param orderId the orderId to set
	 */
	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}

	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}

	/**
	 * @return the applicant
	 */
	public String getApplicant() {
		return applicant;
	}

	/**
	 * @param applicant the applicant to set
	 */
	public void setApplicant(String applicant) {
		this.applicant = applicant;
	}

	/**
	 * @return the evaluationTime
	 */
	public String getEvaluationTime() {
		return evaluationTime;
	}

	/**
	 * @param evaluationTime the evaluationTime to set
	 */
	public void setEvaluationTime(String evaluationTime) {
		this.evaluationTime = evaluationTime;
	}

	/**
	 * @return the starLevel
	 */
	public String getStarLevel() {
		return starLevel;
	}

	/**
	 * @param starLevel the starLevel to set
	 */
	public void setStarLevel(String starLevel) {
		int star = Integer.parseInt(starLevel);
		String starImg = "";
		switch (star) {
		case 1:
			starImg = "1kx.png";
			setStarName("一颗星");
			break;
		case 2:
			starImg = "2kx.png";
			setStarName("二颗星");
			break;
		case 3:
			starImg = "3kx.png";
			setStarName("三颗星");
			break;
		case 4:
			starImg = "4kx.png";
			setStarName("四颗星");
			break;
		case 5:
			starImg = "5kx.png";
			setStarName("五颗星");
			break;
		default:
			starImg = "";
			break;
		}
		this.starLevel = starImg;
	}

	/**
	 * @return the starName
	 */
	public String getStarName() {
		return starName;
	}

	/**
	 * @param starName the starName to set
	 */
	public void setStarName(String starName) {
		this.starName = starName;
	}
	
}
