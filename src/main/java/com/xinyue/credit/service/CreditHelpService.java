package com.xinyue.credit.service;

import java.util.List;

import com.xinyue.credit.model.HelpModel;

/**
 * 
 * @author wenhai.you
 * @2015年7月2日
 * @下午5:19:34
 */
public interface CreditHelpService {

	public List<HelpModel> findPageList(int start , int pageSize);
	
	public int getCount();
	
	public HelpModel findHelpById(String id);
	
}
