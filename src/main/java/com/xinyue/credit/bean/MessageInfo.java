package com.xinyue.credit.bean;

import java.io.Serializable;

import com.xinyue.credit.util.Globals;

/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午10:47:35
 */
public class MessageInfo implements Serializable {

	private String startTime;
	private String endTime;
	private String topage;
	private int pageSize = Globals.PAGE_SIZE;
	private String hasRead;
	private int start;
	private String userid;
	private String record;
	private int recordindex;
	private int index;
	
	public int getIndex() {
		return index;
	}
	public void setIndex(int index) {
		this.index = index;
	}
	public int getRecordindex() {
		return recordindex;
	}
	public void setRecordindex(int recordindex) {
		this.recordindex = recordindex;
	}
	public String getRecord() {
		return record;
	}
	public void setRecord(String record) {
		this.record = record;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public String getHasRead() {
		return hasRead;
	}
	public void setHasRead(String hasRead) {
		this.hasRead = hasRead;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getTopage() {
		return topage;
	}
	public void setTopage(String topage) {
		this.topage = topage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
}
