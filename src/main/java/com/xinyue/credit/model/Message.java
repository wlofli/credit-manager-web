package com.xinyue.credit.model;
/**
 * 
 * @author wenhai.you
 * @2015年7月13日
 * @上午10:21:06
 */
public class Message extends ModelBase {

	private int id;
	private String title;
	private String content;
	private String deleted;
	private String hasRead;
	private String messageid;
	private String sendTime;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDeleted() {
		return deleted;
	}
	public void setDeleted(String deleted) {
		this.deleted = deleted;
	}
	public String getHasRead() {
		return hasRead;
	}
	public void setHasRead(String hasRead) {
		this.hasRead = hasRead;
	}
	public String getMessageid() {
		return messageid;
	}
	public void setMessageid(String messageid) {
		this.messageid = messageid;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	
}
