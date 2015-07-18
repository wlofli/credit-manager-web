package com.xinyue.credit.model;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 操作者与时间
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年6月30日
 */
public class ModelBase implements Serializable {

	/**
	 * UID
	 */
	private static final long serialVersionUID = -1962614361032472048L;

	@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private Date createdTime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd" )
	private Date modifiedTime;
	
	private String createdId;
	
	private String modifiedId;

	/**
	 * @return 创建时间
	 */
	public Date getCreatedTime() {
		return createdTime;
	}

	/**
	 * @param 时间 设置创建时间
	 */
	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	/**
	 * @return the modifiedTime
	 */
	public Date getModifiedTime() {
		return modifiedTime;
	}

	/**
	 * @param modifiedTime the modifiedTime to set
	 */
	public void setModifiedTime(Date modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	/**
	 * @return the createdId
	 */
	public String getCreatedId() {
		return createdId;
	}

	/**
	 * @param createdId the createdId to set
	 */
	public void setCreatedId(String createdId) {
		this.createdId = createdId;
	}

	/**
	 * @return the modifiedId
	 */
	public String getModifiedId() {
		return modifiedId;
	}

	/**
	 * @param modifiedId the modifiedId to set
	 */
	public void setModifiedId(String modifiedId) {
		this.modifiedId = modifiedId;
	}
	
	
}
