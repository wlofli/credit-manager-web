package com.xinyue.credit.service;

import java.util.List;

import com.xinyue.credit.model.CustomerEvaluation;

/**
 * 客户评价服务层
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
public interface CustomerManageService {

	/**
	 * 客户评价
	 * @param managerId
	 * @param star
	 * @param index 
	 * @return
	 */
	List<CustomerEvaluation> getEvaluationsOrderByStar(String managerId,int star, int index);

	/**
	 * 根据信贷经理查询订单评价数
	 * @param managerId
	 * @return
	 */
	int getEvaluationsCountByManagerId(String managerId);

}
