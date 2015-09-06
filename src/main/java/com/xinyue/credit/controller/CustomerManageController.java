package com.xinyue.credit.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyue.credit.bean.CustomerEvaluationSearch;
import com.xinyue.credit.model.CustomerEvaluation;
import com.xinyue.credit.model.User;
import com.xinyue.credit.service.CustomerManageService;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.SelectService;

/**
 * 客户管理
 * 
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月20日
 */
@Controller
public class CustomerManageController {

	@Resource
	private SelectService selectService;

	@Resource
	private CustomerManageService customerManageService;

	/**
	 * 客户评价列表
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/customer/evaluation")
	public String evaluationList(HttpServletRequest request, Model model) {

		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);

		// 检索条件
		model.addAttribute("ceSearch", new CustomerEvaluationSearch());

		// 星级
		List<SelectInfo> stars = selectService
				.findSelectByType(Globals.STAR_LEVEL);
		model.addAttribute("stars", stars);

		//结果
		PageData<CustomerEvaluation> pageData = getData(user.getId(), 0, 1);
		
		model.addAttribute("evaluations", pageData.getData());
		model.addAttribute("pageData", pageData);

		return "credit/customer/customer_evaluation";
	}

	/**
	 * 检索
	 * @param request
	 * @param model
	 * @param ceSearch
	 * @return
	 */
	@RequestMapping(value = "/customer/search", method = RequestMethod.POST)
	public String search(HttpServletRequest request, Model model,
			CustomerEvaluationSearch ceSearch) {

		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);

		// 星级
		List<SelectInfo> stars = selectService
				.findSelectByType(Globals.STAR_LEVEL);
		model.addAttribute("stars", stars);
		
		PageData<CustomerEvaluation> pageData = getData(user.getId(), ceSearch.getStarLevel(), ceSearch.getPage());
		
		model.addAttribute("evaluations", pageData.getData());
		model.addAttribute("ceSearch", ceSearch);

		return "credit/customer/customer_evaluation";
	}
	
	/**
	 * 获取数据
	 * @param managerId
	 * @param star
	 * @param currentPage
	 * @return
	 */
	private PageData<CustomerEvaluation> getData(String managerId,int star,int currentPage){
		
		List<CustomerEvaluation> evaluations = customerManageService
				.getEvaluationsOrderByStar(managerId, star,currentPage-1);
		
		int countAll = customerManageService.getEvaluationsCountByManagerId(managerId);
		
		PageData<CustomerEvaluation> pageData = new PageData<>(evaluations, countAll, currentPage);
		
		return pageData;
	}
}
