package com.xinyue.credit.service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.credit.dao.CustomerManageDAO;
import com.xinyue.credit.model.CustomerEvaluation;
import com.xinyue.credit.service.CustomerManageService;

/**
 * 客户管理服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
@Service
public class CustomerManageServiceImpl implements CustomerManageService {

	@Resource
	private CustomerManageDAO customerManageDAO;
	
	private Logger log = Logger.getLogger(CustomerManageServiceImpl.class);
	
	@Override
	public List<CustomerEvaluation> getEvaluationsOrderByStar(String managerId,
			int star,int index) {
		HashMap<String, Object> map = new HashMap<>();
		map.clear();
		map.put("managerId", managerId);
		map.put("star", star);
		map.put("index", index*10);
		
		List<CustomerEvaluation> list = null;
		try {
			list = customerManageDAO.getEvaluationsOrderByStar(map);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return list;
	}

	@Override
	public int getEvaluationsCountByManagerId(String managerId) {
		return customerManageDAO.getEvaluationsCountByManagerId(managerId);
	}

}
