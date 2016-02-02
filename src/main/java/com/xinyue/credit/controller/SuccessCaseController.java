package com.xinyue.credit.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.credit.model.User;
import com.xinyue.credit.util.Globals;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.beans.SuccessCaseSearch;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.service.SuccessCaseService;
import com.xinyue.manage.util.GlobalConstant;

@Controller
@RequestMapping("/credit")
public class SuccessCaseController {

	@Resource
	SuccessCaseService successCaseService;
	
	@Resource
	ProductService productService;
	
	@Resource
	SelectService selectService;

	/**
	 * 首次进入
	 * 
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value = "/case/list")
	public String successCaseList(HttpServletRequest request, Model model) {

		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);

		SuccessCaseSearch search = new SuccessCaseSearch();
		search.setManagerId(user.getId());
		model.addAttribute("searchInfo", search);

		// 列表
		PageData<SuccessCase> result = this.findSuccessCases(search);
		model.addAttribute("successCases", result.getData());
		model.addAttribute("mpage", result);

		return "credit/case/success_case_list";
	}

	/**
	 * 检索
	 * 
	 * @param request
	 * @param model
	 * @param searchInfo
	 * @return
	 */
	@RequestMapping(value = {"/case/search","/case/page"}, method = RequestMethod.POST)
	public String caseSearch(HttpServletRequest request, Model model,
			SuccessCaseSearch searchInfo) {

		model.addAttribute("searchInfo", searchInfo);

		// 列表
		PageData<SuccessCase> result = this.findSuccessCases(searchInfo);
		model.addAttribute("successCases", result.getData());
		model.addAttribute("mpage", result);

		return "credit/case/success_case_list";
	}
	
	/**
	 * 删除成功案例
	 * @param managerIds
	 * @return
	 */
	@RequestMapping(value="/case/delete",method = RequestMethod.POST)
	public @ResponseBody String deleteCase(HttpServletRequest request,String caseIds) {
		
		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);
		
		boolean result = successCaseService.deleteCaseById(caseIds,user.getId());
		
		if (result) {
			return "true";
		}
		
		return "false";
	}
	
	/**
	 * 编辑画面
	 * @param request
	 * @param model
	 * @param caseId
	 * @return
	 */
	@RequestMapping(value={"/case/add","/case/edit"})
	public String editCase(HttpServletRequest request,Model model,String caseId) {
		
		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);
		
		//产品
		List<SelectInfo> products = productService.findProductsManagerId(user.getId());

		model.addAttribute("products", products);
		
		//贷款类型
		List<SelectInfo> loanTypes = selectService.findSelectByType(GlobalConstant.LOAN_TYPE);
		
		model.addAttribute("loanTypes", loanTypes);
		
		//省
		List<SelectInfo> provinces = selectService.findProvince();
		model.addAttribute("provinces", provinces);
		
		SuccessCase sc = null;
		if (caseId==null || caseId.equals("")) {
			sc = new SuccessCase();
			sc.setOrderNumber("1");
			model.addAttribute("type", "新增");
		}else {
			sc = successCaseService.getSuccessCaseByCaseId(caseId);
			model.addAttribute("type", "编辑");
		}
		
		
		model.addAttribute("caseInfo", sc);
		return "credit/case/success_case_edit";
	}
	
	
	//modified by lzc 方法改成@responsebody形式
	@RequestMapping(value="/case/save",method=RequestMethod.POST)
	@ResponseBody
	public String saveCase(HttpServletRequest request,Model model,SuccessCase caseInfo) {
		User user = (User) request.getSession().getAttribute(
				Globals.SESSION_USER_INFO);
		caseInfo.setCreditManagerId(user.getId());
		caseInfo.setCreditManagerName(user.getRealName());
		
		boolean result = successCaseService.saveCase(caseInfo);
		
		if (result) {
			return GlobalConstant.RET_SUCCESS;
		}
		return GlobalConstant.RET_FAIL;
	}

	/**
	 * 条件检索
	 * 
	 * @param search
	 *            条件
	 * @return
	 */
	private PageData<SuccessCase> findSuccessCases(SuccessCaseSearch search) {

		PageData<SuccessCase> data = successCaseService
				.findSuccessCaseList(search);

		return data;
	}
}
