package com.xinyue.credit.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.credit.model.HelpModel;

/**
 * 
 * @author wenhai.you
 * @2015年7月2日
 * @下午4:48:23
 */
public interface CreditHelpDao {

	public List<HelpModel> findPageList(@Param("id") int id , @Param("start") int start , @Param("pageSize") int pageSize);
	
	public int getCount(int id);
	
	public HelpModel findHelpById(String id);

}
