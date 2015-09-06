package com.xinyue.credit.dao;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.bean.RecommendCredit;
import com.xinyue.credit.bean.RecommendMember;


/**
 * 
 * @author wenhai.you
 * @2015年7月15日
 * @下午4:23:41
 */
public interface RecommendMemberDao {

	public String getYaoqm(@Param("id")String id);
	
	public RecommendMember getRecommendMember(@Param("code") String code);
	
	public RecommendCredit getRecommendCredit(@Param("code") String code);
}
