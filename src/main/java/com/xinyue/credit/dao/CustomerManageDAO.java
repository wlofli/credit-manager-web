package com.xinyue.credit.dao;

import java.util.HashMap;
import java.util.List;

import com.xinyue.credit.model.CustomerEvaluation;

/**
 * 客户管理DAO
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
public interface CustomerManageDAO {

	int getEvaluationsCountByManagerId(String managerId);

	List<CustomerEvaluation> getEvaluationsOrderByStar(
			HashMap<String, Object> map);

}
