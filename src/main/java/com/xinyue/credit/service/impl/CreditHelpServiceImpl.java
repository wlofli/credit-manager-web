package com.xinyue.credit.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.credit.dao.CreditHelpDao;
import com.xinyue.credit.model.HelpModel;
import com.xinyue.credit.service.CreditHelpService;

/**
 * 
 * @author wenhai.you
 * @2015年7月2日
 * @下午5:19:52
 */
@Service
public class CreditHelpServiceImpl implements CreditHelpService {

	@Resource
	private CreditHelpDao hdao;
	@Override
	public List<HelpModel> findPageList(int start, int pageSize) {
		// TODO Auto-generated method stub
		return hdao.findPageList(2, start, pageSize);
	}
	
	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return hdao.getCount(2);
	}
	
	@Override
	public HelpModel findHelpById(String id) {
		// TODO Auto-generated method stub
		return hdao.findHelpById(id);
	}
}
