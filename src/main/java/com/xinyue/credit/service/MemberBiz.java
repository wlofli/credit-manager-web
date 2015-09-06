package com.xinyue.credit.service;

import com.xinyue.credit.bean.RecommendCredit;
import com.xinyue.credit.bean.RecommendMember;


/**
 * 
 * @author wenhai.you
 * @2015年7月15日
 * @下午4:30:47
 */
public interface MemberBiz {

	public String getYaoqm(String id);
	
	public RecommendMember getRecommendMember(String code);
	
	public RecommendCredit getRecommendCredit(String code);
	
	public String createCode(String url);
}
