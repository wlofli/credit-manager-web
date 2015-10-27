package com.xinyue.credit.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.credit.dao.RecommendMemberDao;
import com.xinyue.credit.service.MemberBiz;
import com.xinyue.manage.beans.RecommendCredit;
import com.xinyue.manage.beans.RecommendMember;
import com.xinyue.manage.util.CommonFunction;

/**
 * 
 * @author wenhai.you
 * @2015年7月15日
 * @下午4:32:44
 */
@Service
public class MemberBizImpl implements MemberBiz {

	@Resource
	private RecommendMemberDao mdao;
	@Override
	public String getYaoqm(String id) {
		// TODO Auto-generated method stub
		return mdao.getYaoqm(id);
	}
	
	@Override
	public RecommendCredit getRecommendCredit(String code) {
		// TODO Auto-generated method stub
		return mdao.getRecommendCredit(code);
	}
	
	@Override
	public RecommendMember getRecommendMember(String code) {
		// TODO Auto-generated method stub
		return mdao.getRecommendMember(code);
	}

	public String createCode(String url){
		try {
			String date = CommonFunction.createCode(url, CommonFunction.getValue("upload.path")+"code/");
			return new StringBuffer(CommonFunction.getValue("down.path")).append("moko/images/code/").append(date).append("_qrCode.jpg").toString();
		} catch (Exception e) {
			// TODO: handle exception
			return "";
		}
	}
}
