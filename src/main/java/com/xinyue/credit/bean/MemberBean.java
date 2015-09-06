package com.xinyue.credit.bean;

import java.io.Serializable;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @上午9:18:08
 */
public class MemberBean implements Serializable {

	private String tel;
	private String email;
	private String link;
	
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		if(tel != null || !"".equals(tel)){
			this.tel = tel.trim();
		}
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		if(email != null || !"".equals(email)){
			this.email = email;
		}
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	@Override
	public String toString() {
		return "MemberBean [tel=" + tel + ", email=" + email + ", link=" + link
				+ "]";
	}
	
}
